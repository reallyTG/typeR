library(nparcomp)


### Name: summary.mctp.rm
### Title: Summary of 'mctp.rm'
### Aliases: summary.mctp.rm
### Keywords: print

### ** Examples

data(panic)
a<-mctp.rm(CGI~week, data=panic, type = "Dunnett",
           alternative = "two.sided",
           asy.method =  "fisher", contrast.matrix = NULL)
summary(a)



