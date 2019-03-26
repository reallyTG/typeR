library(sampSurf)


### Name: monte
### Title: Generate Objects of Class "'monte'"
### Aliases: monte
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# these examples are commented-out because they consume 
# cpu time when checking the package--just copy and paste
# them if you want to try them out...
#
# from a sampSurf object...
#
## Not run: 
##D smTract = Tract(c(x=30,y=30), cellSize=0.5)
##D smbuffTr = bufferedTract(8,smTract)
##D ss.sa = sampSurf(10, smbuffTr, 'sausageIZ', plotRadius=3, estimate='Length')
##D m.sa = monte(ss.sa, n=c(10,20))
##D hist(m.sa)
## End(Not run)

#
# simple population...
#
## Not run: 
##D mp = montePop(rnorm(100), n=c(10,30))
##D mt = monte(mp, mcSamples=250, R=150)     #takes n from mp object
##D mt
## End(Not run)



