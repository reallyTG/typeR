library(lmomco)


### Name: lmomgev
### Title: L-moments of the Generalized Extreme Value Distribution
### Aliases: lmomgev
### Keywords: L-moment (distribution) Distribution: Generalized Extreme
###   Value

### ** Examples

lmr <- lmoms(c(123,34,4,654,37,78))
lmomgev(pargev(lmr))

## Not run: 
##D # The Gumbel is a limiting version of the maxima regardless of parent. The GLO,
##D # PE3 (twice), and GPA are studied here. A giant number of events to simulate is made.
##D # Then numbers of events per year before the annual maxima are computed are specified.
##D # The Gumbel is a limiting version of the maxima regardless of parent. The GLO,
##D # PE3 (twice), and GPA are studied here. A giant number of events to simulate is made.
##D # Then numbers of events per year before the annual maxima are computed are specified.
##D nevents <- 100000
##D nev_yr <- c(1,2,3,4,5,6,10,15,20,30,50,100,200,500); n <- length(nev_yr)
##D pdf("Gumbel_in_the_limit.pdf", useDingbats=FALSE)
##D # Draw the usually L-moment ratio diagram but only show a few of the
##D # three parameter families.
##D plotlmrdia(lmrdia(), xlim=c(-.5,0.5), ylim=c(0,0.3), nopoints=TRUE,
##D            autolegend=TRUE, noaep4=TRUE, nogov=TRUE, xleg=0.1, yleg=0.3)
##D gum <- lmrdia()$gum # extract the L-skew and L-kurtosis of the Gumbel
##D points(gum[1], gum[2], pch=10, cex=3, col=2) # draw the Gumbel
##D 
##D para <- parglo(vec2lmom(c(1,.1,0))) # generalized logistic
##D t3 <- t4 <- rep(NA, n) # define
##D for(k in 1:n) { # generate GLO time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/nev_yr[k], function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=3)
##D 
##D para <- parglo(vec2lmom(c(1,.1,0.3))) # generalized logistic
##D t3 <- t4 <- rep(NA, n) # define
##D for(k in 1:n) { # generate GLO time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/nev_yr[k], function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=3)
##D 
##D para <- parglo(vec2lmom(c(1,.1,-0.3))) # generalized logistic
##D t3 <- t4 <- rep(NA, n) # define
##D for(k in 1:n) { # generate GLO time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/nev_yr[k], function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=3)
##D 
##D para <- parpe3(vec2lmom(c(1,.1,.4))) # Pearson type III
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate PE3 time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=6)
##D 
##D para <- parpe3(vec2lmom(c(1,.1,0))) # Pearson type III
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate another PE3 time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=6)
##D 
##D para <- parpe3(vec2lmom(c(1,.1,-.4))) # Pearson type III
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate PE3 time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=6)
##D 
##D para <- pargpa(vec2lmom(c(1,.1,0))) # generalized Pareto
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate GPA time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=4)
##D 
##D para <- pargpa(vec2lmom(c(1,.1,.4))) # generalized Pareto
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate GPA time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=4)
##D 
##D para <- pargpa(vec2lmom(c(1,.1,-.4))) # generalized Pareto
##D t3 <- t4 <- rep(NA, n) # reset
##D for(k in 1:n) { # generate GPA time series of annual maxima with k-events per year
##D    lmr <- lmoms(sapply(1:nevents/k, function(i) max(rlmomco(nev_yr[k], para))))
##D    t3[k] <- lmr$ratios[3]; t4[k] <- lmr$ratios[4]
##D }
##D lines(t3, t4, lwd=0.8); points(t3, t4, lwd=0.8, pch=21, bg=4)
##D dev.off() #
## End(Not run)



