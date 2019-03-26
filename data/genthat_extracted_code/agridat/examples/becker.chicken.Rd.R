library(agridat)


### Name: becker.chicken
### Title: Mating crosses of chickens
### Aliases: becker.chicken
### Keywords: datasets

### ** Examples


data(becker.chicken)
dat <- becker.chicken

if(require(lattice)){
  dotplot(weight ~ female, data=dat, group=male,
          main="becker.chicken - progeny weight by M*F",
          xlab="female parent",ylab="progeny weight",
          auto.key=list(columns=5))
}

## Not run: 
##D   # Sums match Becker
##D   sum(dat$weight)
##D   aggregate(weight ~  male + female, dat, FUN=sum)
##D 
##D   # Variance components
##D   require(lme4)
##D   require(lucid)
##D   m1 <- lmer(weight ~  (1|male) + (1|female), data=dat)
##D   as.data.frame(lme4::VarCorr(m1))
##D   ## grp        var1 var2      vcov    sdcor
##D   ## 1   female (Intercept) <NA> 1095.6296 33.10030
##D   ## 2     male (Intercept) <NA>  776.7543 27.87031
##D   ## 3 Residual        <NA> <NA> 5524.4000 74.32631
##D 
##D   # Calculate heritabilities
##D   s2m <- 776  # variability for males
##D   s2f <- 1095 # variability for females
##D   s2w <- 5524 # variability within crosses
##D   vp <- s2m + s2f + s2w # 7395
##D   4*s2m/vp # .42 male heritability
##D   4*s2f/vp # .59 female heritability
##D 
## End(Not run)




