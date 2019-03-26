library(agridat)


### Name: vaneeuwijk.fusarium
### Title: Infection of wheat varieties by Fusarium strains from 1990 to
###   1993
### Aliases: vaneeuwijk.fusarium
### Keywords: datasets

### ** Examples


data(vaneeuwijk.fusarium)
dat <- vaneeuwijk.fusarium
dat <- transform(dat, year=factor(year))
dat <- transform(dat, logity=log((y/100)/(1-y/100)))

if(require(HH)){
  position(dat$year) <- c(3,9,14,19)
  position(dat$strain) <- c(2,5,8,11,14,17,20)
  HH::interaction2wt(logity ~ gen+year+strain,dat,rot=c(90,0),
                     x.between=0, y.between=0,
                     main="vaneeuwijk.fusarium")
}

## Not run: 
##D   # anova on logit scale. Near match to VanEeuwijk table 6
##D   m1 <- aov(logity ~ gen*strain*year, data=dat)
##D   anova(m1)
##D   ## Response: logity
##D   ##                  Df Sum Sq Mean Sq F value Pr(>F)
##D   ## gen              19 157.55   8.292               
##D   ## strain            6  91.54  15.256               
##D   ## year              3 321.99 107.331               
##D   ## gen:strain      114  34.03   0.299               
##D   ## gen:year         57 140.94   2.473               
##D   ## strain:year      18 236.95  13.164               
##D   ## gen:strain:year 342  93.15   0.272               
## End(Not run)




