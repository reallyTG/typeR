library(nzilbb.labbcat)


### Name: labbcat.instance
### Title: Connects to the given 'LaBB-CAT' instance, and returns and
###   object that must be used for all other functions.
### Aliases: labbcat.instance
### Keywords: connect password timeout username

### ** Examples

## connect to an open or password-protected instance of LaBB-CAT
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/")

## connect to a password-protected instance of LaBB-CAT with explicit credentials
labbcat <- labbcat.instance("https://labbcat.canterbury.ac.nz/demo/",
     username="demo", password="demo")




