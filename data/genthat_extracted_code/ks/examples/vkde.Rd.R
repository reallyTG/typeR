library(ks)


### Name: vkde
### Title: Variable kernel density estimate.
### Aliases: kde.balloon kde.sp
### Keywords: smooth

### ** Examples

## No test: 
data(worldbank)
wb <- as.matrix(na.omit(worldbank[,4:5]))
xmin <- c(-70,-25); xmax <- c(25,70)
fhat <- kde(x=wb, xmin=xmin, xmax=xmax)
fhat.sp <- kde.sp(x=wb, xmin=xmin, xmax=xmax)
plot(fhat, display="persp", box=TRUE, phi=20, zlim=c(0,max(fhat.sp$estimate)))
plot(fhat.sp, display="persp", box=TRUE, phi=20, zlim=c(0,max(fhat.sp$estimate)))
## End(No test)
## Not run: 
##D fhat.ball <- kde.balloon(x=wb, xmin=xmin, xmax=xmax)
##D plot(fhat.ball, display="persp", box=TRUE, phi=20, zlim=c(0,max(fhat.sp$estimate)))
## End(Not run)


