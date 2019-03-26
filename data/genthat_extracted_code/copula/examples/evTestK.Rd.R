library(copula)


### Name: evTestK
### Title: Bivariate Test of Extreme-Value Dependence Based on Kendall's
###   Distribution
### Aliases: evTestK
### Keywords: htest multivariate

### ** Examples

set.seed(321)
## Do the data come from an extreme-value copula?
evTestK(Ug <- rCopula(200, gumbelCopula(3))) # not significant => yes, EV
    dim(Uc <- rCopula(200, claytonCopula(3)))
## Clayton:                       tests are highly significant => no, not EV
(K1 <- evTestK(Uc))
(K2 <- evTestK(Uc, method = "asymptotic"))
## No test: 
system.time(print(K3 <- evTestK(Uc, method = "jackknife")))
## slower: 1.06 sec (2015 intel core i7)
## End(No test)
## Don't show: 
Xtra <- copula:::doExtras()
stopifnot(all.equal(K1$p.value, 3.9471315e-9, tolerance = .001),
          all.equal(K2$p.value, 2.1277296e-9, tolerance = .001),
          if(Xtra) { set.seed(1)
            print(system.time(K3 <- evTestK(Uc, method = "jackknife")))
            all.equal(K3$p.value, 0.0 , tolerance = .001) # ??
          } else TRUE
         )
system.time(T1 <- evTestK(Ug))
system.time(T2 <- evTestK(Ug, method = "asymptotic"))
stopifnot(all.equal(T1$p.value, 0.1363025, tolerance = .001),
          all.equal(T2$p.value, 0.1217252, tolerance = .001),
          if(Xtra) { set.seed(2)
            print(system.time(T3 <- evTestK(Ug, method = "jackknife")))# 3.6 sec
            all.equal(T3$p.value, 0.1507736 , tolerance = .001) #?
          } else TRUE
         )
## End(Don't show)



