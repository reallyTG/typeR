library(aws.signature)


### Name: signature_v4
### Title: Signature Version 4
### Aliases: signature_v4

### ** Examples

## Not run: 
##D # From AWS documentation
##D # http://docs.aws.amazon.com/general/latest/gr/signature-v4-test-suite.html
##D StringToSign <- "AWS4-HMAC-SHA256
##D 20110909T233600Z
##D 20110909/us-east-1/host/aws4_request
##D e25f777ba161a0f1baf778a87faf057187cf5987f17953320e3ca399feb5f00d"
##D 
##D sig <- 
##D signature_v4(secret = 'wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY',
##D              date = '20110909',
##D              region = 'us-east-1',
##D              service = 'host',
##D              string_to_sign = StringToSign)
##D identical(sig, "be7148d34ebccdc6423b19085378aa0bee970bdc61d144bd1a8c48c33079ab09")
##D 
##D # http://docs.aws.amazon.com/general/latest/gr/sigv4-calculate-signature.html
##D StringToSign <- "AWS4-HMAC-SHA256
##D 20110909T233600Z
##D 20110909/us-east-1/iam/aws4_request
##D 3511de7e95d28ecd39e9513b642aee07e54f4941150d8df8bf94b328ef7e55e2"
##D 
##D sig <- 
##D signature_v4(secret = 'wJalrXUtnFEMI/K7MDENG+bPxRfiCYEXAMPLEKEY',
##D              date = '20110909',
##D              region = 'us-east-1',
##D              service = 'iam',
##D              string_to_sign = StringToSign)
##D identical(sig, "ced6826de92d2bdeed8f846f0bf508e8559e98e4b0199114b84c54174deb456c")
## End(Not run)



