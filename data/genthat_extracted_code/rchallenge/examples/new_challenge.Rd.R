library(rchallenge)


### Name: new_challenge
### Title: Install a new challenge.
### Aliases: new_challenge

### ** Examples

path <- tempdir()
wd <- setwd(path)
# english version
new_challenge()
# french version
new_challenge(template = "fr")
setwd(wd)
unlink(path)



