library(pathmapping)


### Name: SimplifyPath
### Title: Simplify a path
### Aliases: SimplifyPath

### ** Examples

path <- cbind(1:100,exp(-(1:100-50)^2/80))
path2 <- SimplifyPath(path)

## Not run: 
##D plot(path)
##D plot(path2)
##D plot(path)
##D points(SimplifyPath(path,tolerance=.1),type="o",
##D         col="red",cex=1.2,lwd=2)
##D plot(path)
##D points(SimplifyPath(path,tolerance=.01,plot=TRUE),type="o",
##D         col="red",cex=1.2,lwd=2)
##D plot(path)
##D points(SimplifyPath(path,tolerance=.005,plot=TRUE),type="o",
##D         col="red",cex=1.2,lwd=2)
## End(Not run)



