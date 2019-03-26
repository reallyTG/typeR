library(REDCapR)


### Name: sanitize_token
### Title: Validate and sanitize the user's REDCap token.
### Aliases: sanitize_token

### ** Examples

library(REDCapR) #Load the package into the current R session.
secret_token_1 <- "12345678901234567890123456ABCDEF"
secret_token_2 <- "12345678901234567890123456ABCDEF\n"
sanitize_token(secret_token_1)
sanitize_token(secret_token_2)



