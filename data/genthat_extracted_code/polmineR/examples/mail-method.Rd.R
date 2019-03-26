library(polmineR)


### Name: mail
### Title: Send the result of an analysis by Email.
### Aliases: mail mail-method mail,textstat-method mail,data.frame-method
###   mail,kwic-method

### ** Examples

# Get all (global) options for the polmineR package
grep("polmineR", names(options()), value = TRUE)

# Get options that need to be set
getOption("polmineR.email")
getOption("polmineR.smtp_server")
getOption("polmineR.smtp_port")

# Sample options (let us imagine Donald Duck had a mail-account)
options("polmineR.email" = "donald.duck@duckmail.org")
options("polmineR.smtp_port" = "587")
options("polmineR.smtp_server" = "smtp.duckmail.org")

# This is how you send out results when options are set
# (Note: Mail servers that require authentication are not yet supported.)
## Not run: 
##D y <- cooccurrences("REUTERS", query = "oil")
##D mail(y)
##D 
##D k <- kwic("REUTERS", query = "oil")
##D mail(k)
## End(Not run)



