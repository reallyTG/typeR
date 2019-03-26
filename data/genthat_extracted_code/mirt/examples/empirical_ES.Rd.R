library(mirt)


### Name: empirical_ES
### Title: Empirical effect sizes based on latent trait estimates
### Aliases: empirical_ES

### ** Examples

## Not run: 
##D 
##D #no DIF
##D set.seed(12345)
##D a <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D itemtype <- rep('2PL', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('Ref', N), rep('Focal', N))
##D 
##D mod <- multipleGroup(dat, 1, group = group,
##D    invariance = c(colnames(dat)[1:5], 'free_means', 'free_var'))
##D coef(mod, simplify=TRUE)
##D 
##D empirical_ES(mod)
##D empirical_ES(mod, DIF=FALSE)
##D empirical_ES(mod, DIF=FALSE, focal_items = 10:15)
##D 
##D empirical_ES(mod, plot=TRUE)
##D empirical_ES(mod, plot=TRUE, DIF=FALSE)
##D 
##D ###---------------------------------------------
##D # DIF
##D set.seed(12345)
##D a1 <- a2 <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d1 <- d2 <- matrix(rnorm(15,0,.7),ncol=1)
##D a2[10:15,] <- a2[10:15,] + rnorm(6, 0, .3)
##D d2[10:15,] <- d2[10:15,] + rnorm(6, 0, .3)
##D itemtype <- rep('dich', nrow(a1))
##D N <- 1000
##D dataset1 <- simdata(a1, d1, N, itemtype)
##D dataset2 <- simdata(a2, d2, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('Ref', N), rep('Focal', N))
##D 
##D mod <- multipleGroup(dat, 1, group = group,
##D    invariance = c(colnames(dat)[1:5], 'free_means', 'free_var'))
##D coef(mod, simplify=TRUE)
##D 
##D empirical_ES(mod)
##D empirical_ES(mod, DIF = FALSE)
##D empirical_ES(mod, plot=TRUE)
##D empirical_ES(mod, plot=TRUE, DIF=FALSE)
##D 
## End(Not run)



