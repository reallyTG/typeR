library(mirt)


### Name: personfit
### Title: Person fit statistics
### Aliases: personfit
### Keywords: fit person

### ** Examples


## Not run: 
##D 
##D #make some data
##D set.seed(1)
##D a <- matrix(rlnorm(20),ncol=1)
##D d <- matrix(rnorm(20),ncol=1)
##D items <- rep('2PL', 20)
##D data <- simdata(a,d, 2000, items)
##D 
##D x <- mirt(data, 1)
##D fit <- personfit(x)
##D head(fit)
##D 
##D #using precomputed Theta
##D Theta <- fscores(x, method = 'MAP', full.scores = TRUE)
##D head(personfit(x, Theta=Theta))
##D 
##D #multiple group Rasch model example
##D set.seed(12345)
##D a <- matrix(rep(1, 15), ncol=1)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D itemtype <- rep('dich', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D models <- 'F1 = 1-15'
##D mod_Rasch <- multipleGroup(dat, models, itemtype = 'Rasch', group = group)
##D coef(mod_Rasch, simplify=TRUE)
##D pf <- personfit(mod_Rasch, method='MAP')
##D head(pf)
##D 
##D   
## End(Not run)




