library(imguR)


### Name: account
### Title: Retrieve user account details
### Aliases: account account_verified send_verification

### ** Examples

## Not run: 
##D # get account details for a user account
##D account('thosjleeper')
##D 
##D # check account verification
##D tkn <- imgur_login()
##D if(!account_verified(token = tkn))
##D     send_verification(token = tkn)
##D account(token = tkn)
## End(Not run)



