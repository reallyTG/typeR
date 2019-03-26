library(nsrr)


### Name: nsrr_token
### Title: NSRR Token
### Aliases: nsrr_token nsrr_have_token nsrr_auth nsrr_authenticated

### ** Examples

is.null(nsrr_token())
if (!is.null(nsrr_token())) {
   res = nsrr_auth()
   res$authenticated
}
bad_res = nsrr_auth("")
bad_res$authenticated
nsrr_have_token()



