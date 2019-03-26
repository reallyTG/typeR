library(asbio)


### Name: anm.ci
### Title: Animation demonstrations of confidence intervals.
### Aliases: anm.ci anm.ci.tck
### Keywords: graphs

### ** Examples

## Not run: 
##D parent<-rnorm(100000)
##D anm.ci(parent, par.val=0, conf =.95, sigma =1, par.type="mu")
##D anm.ci(parent, par.val=1, conf =.95, par.type="sigma.sq")
##D anm.ci(parent, par.val=0, conf =.95, par.type="median")
##D parent<-rbinom(100000,1,p=.65)
##D anm.ci(parent, par.val=0.65, conf =.95, par.type="p")
##D ##Interactive GUI, requires package 'tcltk'
##D anm.ci.tck()
## End(Not run)



