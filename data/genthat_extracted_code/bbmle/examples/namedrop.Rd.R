library(bbmle)


### Name: namedrop
### Title: drop unneeded names from list elements
### Aliases: namedrop
### Keywords: misc

### ** Examples

x = list(a=c(a=1),b=c(d=1,d=2),c=c(a=1,b=2,c=3))
names(unlist(namedrop(x)))
names(unlist(namedrop(x)))



