library(mirt)


### Name: itemGAM
### Title: Parametric smoothed regression lines for item response
###   probability functions
### Aliases: itemGAM plot.itemGAM
### Keywords: fit, item traceline

### ** Examples


## Not run: 
##D set.seed(10)
##D N <- 1000
##D J <- 30
##D 
##D a <- matrix(1, J)
##D d <- matrix(rnorm(J))
##D Theta <- matrix(rnorm(N, 0, 1.5))
##D dat <- simdata(a, d, N, itemtype = '2PL', Theta=Theta)
##D 
##D # make a bad item
##D ps <- exp(Theta^2 + Theta) / (1 + exp(Theta^2 + Theta))
##D item1 <- sapply(ps, function(x) sample(c(0,1), size = 1, prob = c(1-x, x)))
##D 
##D ps2 <- exp(2 * Theta^2 + Theta + .5 * Theta^3) / (1 + exp(2 * Theta^2 + Theta + .5 * Theta^3))
##D item2 <- sapply(ps2, function(x) sample(c(0,1), size = 1, prob = c(1-x, x)))
##D 
##D #' # how the actual item looks in the population
##D plot(Theta, ps, ylim = c(0,1))
##D plot(Theta, ps2, ylim = c(0,1))
##D 
##D baditems <- cbind(item1, item2)
##D newdat <- cbind(dat, baditems)
##D 
##D badmod <- mirt(newdat, 1)
##D itemfit(badmod) #clearly a bad fit for the last two items
##D mod <- mirt(dat, 1) #fit a model that does not contain the bad items
##D itemfit(mod)
##D 
##D #### Pure non-parametric way of investigating the items
##D library(KernSmoothIRT)
##D ks <- ksIRT(newdat, rep(1, ncol(newdat)), 1)
##D plot(ks, item=c(1,31,32))
##D par(ask=FALSE)
##D 
##D # Using point estimates from the model
##D Theta <- fscores(mod)
##D IG0 <- itemGAM(dat[,1], Theta) #good item
##D IG1 <- itemGAM(baditems[,1], Theta)
##D IG2 <- itemGAM(baditems[,2], Theta)
##D plot(IG0)
##D plot(IG1)
##D plot(IG2)
##D 
##D # same as above, but with plausible values to obtain the standard errors
##D set.seed(4321)
##D ThetaPV <- fscores(mod, plausible.draws=10)
##D IG0 <- itemGAM(dat[,1], ThetaPV) #good item
##D IG1 <- itemGAM(baditems[,1], ThetaPV)
##D IG2 <- itemGAM(baditems[,2], ThetaPV)
##D plot(IG0)
##D plot(IG1)
##D plot(IG2)
##D 
##D ## for polytomous test items
##D SAT12[SAT12 == 8] <- NA
##D dat <- key2binary(SAT12,
##D                   key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D dat <- dat[,-32]
##D mod <- mirt(dat, 1)
##D 
##D # Kernal smoothing is very sensitive to which category is selected as 'correct'
##D # 5th category as correct
##D ks <- ksIRT(cbind(dat, SAT12[,32]), c(rep(1, 31), 5), 1)
##D plot(ks, items = c(1,2,32))
##D 
##D # 3rd category as correct
##D ks <- ksIRT(cbind(dat, SAT12[,32]), c(rep(1, 31), 3), 1)
##D plot(ks, items = c(1,2,32))
##D 
##D # splines approach
##D Theta <- fscores(mod)
##D IG <- itemGAM(SAT12[,32], Theta)
##D plot(IG)
##D 
##D set.seed(1423)
##D ThetaPV <- fscores(mod, plausible.draws=10)
##D IG2 <- itemGAM(SAT12[,32], ThetaPV)
##D plot(IG2)
##D 
##D # assuming a simple increasing parametric form (like in a standard IRT model)
##D IG3 <- itemGAM(SAT12[,32], Theta, formula = resp ~ Theta)
##D plot(IG3)
##D IG3 <- itemGAM(SAT12[,32], ThetaPV, formula = resp ~ Theta)
##D plot(IG3)
##D 
##D ### multidimensional example by returning the GAM objects
##D mod2 <- mirt(dat, 2)
##D Theta <- fscores(mod2)
##D IG4 <- itemGAM(SAT12[,32], Theta, formula = resp ~ s(Theta1, k=10) + s(Theta2, k=10),
##D    return.models=TRUE)
##D names(IG4)
##D plot(IG4[[1L]], main = 'Category 1')
##D plot(IG4[[2L]], main = 'Category 2')
##D plot(IG4[[3L]], main = 'Category 3')
##D 
## End(Not run)



