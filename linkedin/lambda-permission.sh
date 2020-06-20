aws lambda add-permission \
    --function-name getCustomerDetails \
    --statement-id 1 \
    --principal connect.amazonaws.com \
    --action lambda:InvokeFunction \
    --source-account 960145048816 \
    --source-arn arn:aws:connect:us-east-1:960145048816:instance/bc7765fc-35f0-45fb-8559-f5e51f3db1fb \
    --region us-east-1

## add resource based policy
{
  "Version": "2012-10-17",
  "Id": "default",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Principal": {
        "Service": "connect.amazonaws.com"
      },
      "Action": "lambda:InvokeFunction",
      "Resource": "arn:aws:lambda:us-east-1:960145048816:function:getCustomerDetails",
      "Condition": {
        "StringEquals": {
          "AWS:SourceAccount": "960145048816"
        },
        "ArnLike": {
          "AWS:SourceArn": "arn:aws:connect:us-east-1:960145048816:instance/bc7765fc-35f0-45fb-8559-f5e51f3db1fb"
        }
      }
    }
  ]
}