library(agridat)


### Name: besag.elbatan
### Title: RCB experiment of 50 varieties of wheat in 3 blocks with strong
###   spatial trend.
### Aliases: besag.elbatan

### ** Examples


data(besag.elbatan)
dat <- besag.elbatan

if(require(desplot)){
  desplot(yield~col*row, dat,
          num=gen, # aspect unknown
          main="besag.elbatan - wheat yields")
}

## Not run: 
##D   # Besag figure 1
##D   library(lattice)
##D   xyplot(yield~row|col, dat, type=c('l'),
##D          layout=c(1,3), main="besag.elbatan wheat yields")
## End(Not run)

# RCB
m1 <- lm(yield ~ 0 + gen + factor(col), dat)
p1 <- coef(m1)[1:50]

## Not run: 
##D   # Formerly used gam package, but as of R 3.1, Rcmd check --as-cran
##D   # is complaining
##D   # Calls: plot.gam ... model.matrix.gam -> predict -> predict.gam -> array
##D   # but it works perfectly in interactive mode !!!
##D   # Remove the FALSE to run the code below
##D   if(is.element("gam", search())) detach(package:gam)
##D   library(mgcv)
##D   m2 <- mgcv::gam(yield ~ -1 + gen + factor(col) + s(row), data=dat)
##D   plot(m2, residuals=TRUE, main="besag.elbatan")
##D   pred <- cbind(dat, predict(m2, dat, type="terms"))
##D   # Need to correct for the average loess effect, which is like
##D   # an overall intercept term.
##D   adjlo <-  mean(pred$"s(row)")
##D   p2 <- coef(m2)[1:50] + adjlo
##D 
##D   # Compare estimates
##D   lims <- range(c(p1,p2))
##D   plot(p1, p2, xlab="RCB prediction",
##D        ylab="RCB with smooth trend (predicted)",
##D        type='n', xlim=lims, ylim=lims,
##D        main="besag.elbatan")
##D   text(p1, p2, 1:50, cex=.5)
##D   abline(0,1,col="gray")
## End(Not run)




