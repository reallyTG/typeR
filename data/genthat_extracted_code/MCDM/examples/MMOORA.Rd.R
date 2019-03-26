library(MCDM)


### Name: MMOORA
### Title: Implementation of MULTIMOORA Method for Multi-Criteria Decision
###   Making Problems.
### Aliases: MMOORA

### ** Examples


 d <- matrix(c(60,6.35,6.8,10,2.5,4.5,3,0.4,0.15,0.1,0.2,0.1,0.08,0.1,2540,1016,1727.2,
 1000,560,1016,1778,500,3000,1500,2000,500,350,1000,990,1041,1676,965,915,508,920),
 nrow=7,ncol=5)
 w <- c(0.036,0.192,0.326,0.326,0.12)
 cb <- c('max','min','max','max','max')
 MMOORA(d,w,cb)



