library(VCA)


### Name: test.fixef
### Title: Perform t-Tests for Linear Contrasts on Fixed Effects.
### Aliases: test.fixef

### ** Examples

## Not run: 
##D data(dataEP05A2_2)
##D ub.dat <- dataEP05A2_2[-c(11,12,23,32,40,41,42),]
##D fit1 <- anovaMM(y~day/(run), ub.dat)
##D fit2 <- remlMM(y~day/(run), ub.dat)
##D fe1 <- fixef(fit1)
##D fe1
##D fe2 <- fixef(fit2)
##D fe2
##D lc.mat <- getL( fit1, c("day1-day2", "day3-day6"))
##D lc.mat
##D test.fixef(fit1, lc.mat, ddfm="satt") 
##D test.fixef(fit2, lc.mat, ddfm="satt")
##D 
##D # some inferential statistics about fixed effects estimates
##D L <- diag(nrow(fe1))
##D rownames(L) <- colnames(L) <- rownames(fe1)
##D test.fixef(fit1, L)
##D test.fixef(fit2, L)
##D 
##D # using different "residual" method determining DFs
##D test.fixef(fit1, L, ddfm="res")
##D test.fixef(fit2, L, ddfm="res")  
##D 
##D # having 'opt=TRUE' is a good idea to save time 
##D # (in case of balanced designs)
##D data(VCAdata1)
##D datS3 <- VCAdata1[VCAdata1$sample==3,]
##D fit3 <- anovaMM(y~(lot+device)/(day)/run, datS3)
##D fit4 <- remlMM(y~(lot+device)/(day)/run, datS3)  
##D fit3$VarCov <- vcovVC(fit3)
##D fe3 <- fixef(fit3)
##D fe4 <- fixef(fit4)
##D L <- diag(nrow(fe3))
##D rownames(L) <- colnames(L) <- rownames(fe3)
##D system.time(tst1 <- test.fixef(fit3, L))
##D system.time(tst2 <- test.fixef(fit3, L, opt=FALSE))
##D system.time(tst3 <- test.fixef(fit4, L, opt=FALSE))
##D tst1
##D tst2
##D tst3
## End(Not run)



