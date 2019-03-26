library(sendmailR)


### Name: sendmail
### Title: Send mail from within R
### Aliases: sendmail
### Keywords: utilities

### ** Examples

## Not run: 
##D from <- sprintf("<sendmailR@\\%s>", Sys.info()[4])
##D to <- "<olafm@datensplitter.net>"
##D subject <- "Hello from R"
##D body <- list("It works!", mime_part(iris))
##D sendmail(from, to, subject, body,
##D          control=list(smtpServer="ASPMX.L.GOOGLE.COM"))
## End(Not run)



