library(dclone)


### Name: dcoptions
### Title: Setting Options
### Aliases: dcoptions
### Keywords: utilities

### ** Examples

## set LB option, but store old value
ov <- dcoptions("LB"=TRUE)
## this is old value
ov
## this is new value
getOption("dcoptions")
## reset to old value
dcoptions(ov)
## check reset
getOption("dcoptions")




