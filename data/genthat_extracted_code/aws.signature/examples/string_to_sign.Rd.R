library(aws.signature)


### Name: string_to_sign
### Title: Construct a String To Sign
### Aliases: string_to_sign

### ** Examples

# From AWS documentation
rh <- "3511de7e95d28ecd39e9513b642aee07e54f4941150d8df8bf94b328ef7e55e2"
sts <- 
string_to_sign(datetime = "20110909T233600Z",
               region = "us-east-1",
               service = "iam",
               request_hash = rh)
identical(sts, "AWS4-HMAC-SHA256
20110909T233600Z
20110909/us-east-1/iam/aws4_request
3511de7e95d28ecd39e9513b642aee07e54f4941150d8df8bf94b328ef7e55e2")




