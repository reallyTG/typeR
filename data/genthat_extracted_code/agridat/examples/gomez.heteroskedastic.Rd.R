library(agridat)


### Name: gomez.heteroskedastic
### Title: RCB in rice with heteroskedastic varieties
### Aliases: gomez.heteroskedastic
### Keywords: datasets

### ** Examples


data(gomez.heteroskedastic)
dat <- gomez.heteroskedastic

# Fix the outlier as reported by Gomez p. 311
dat[dat$gen=="G17" & dat$rep=="R2","yield"] <- 7.58

if(require(lattice)){
  bwplot(gen ~ yield, dat, group=as.numeric(dat$group),
         ylab="genotype", main="gomez.heterogeneous")
}

# Match Gomez table 7.28
m1 <- lm(yield ~ rep + gen, data=dat)
anova(m1)
## Response: yield
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        2  3.306 1.65304  5.6164  0.005528 ** 
## gen       34 40.020 1.17705  3.9992 5.806e-07 ***
## Residuals 68 20.014 0.29432                      




