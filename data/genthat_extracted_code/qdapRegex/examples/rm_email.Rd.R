library(qdapRegex)


### Name: rm_email
### Title: Remove/Replace/Extract Email Addresses
### Aliases: rm_email ex_email
### Keywords: email

### ** Examples

x <- paste("fred is fred@foo.com and joe is joe@example.com - but @this is a 
    twitter handle for twit@here.com or foo+bar@google.com/fred@foo.fnord")

x2 <- c("fred is fred@foo.com and joe is joe@example.com - but @this is a", 
    "twitter handle for twit@here.com or foo+bar@google.com/fred@foo.fnord", 
    "hello world")

rm_email(x)
rm_email(x, replacement = '<a href="mailto:\\1" target="_blank">\\1</a>')
ex_email(x)
ex_email(x2)



