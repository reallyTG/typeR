library(WeibullR)


### Name: plot_contour
### Title: Plotting of Likelihood Ratio Contours from 'wblr' Objects
### Aliases: plot_contour

### ** Examples

set.seed(1234)
fail<-rweibull(5,2,10)
ctest<-wblr(fail)
ctest<-wblr.fit(ctest, method.fit="mle")
ctest<-wblr.conf(ctest, method.conf="lrb",col="red")
fail2<-c(10,40,40,50)
susp<-c(20,60)
ctest2<-wblr(fail2, susp)
ctest2<-wblr.fit(ctest2, method.fit="mle")
ctest2<-wblr.conf(ctest2, method.conf="lrb",col="blue")
## Not run: 
##D  plot_contour(list(ctest, ctest2))
## End(Not run)



