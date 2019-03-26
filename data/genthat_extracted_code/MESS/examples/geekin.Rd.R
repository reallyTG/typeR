library(MESS)


### Name: geekin
### Title: Fit a generalized estimating equation (GEE) model with fixed
###   additive correlation structure
### Aliases: geekin print.geekin
### Keywords: models

### ** Examples



 # Get dataset
 library(kinship2)
 library(mvtnorm)
 data(minnbreast)

 breastpeda <- with(minnbreast[order(minnbreast$famid), ], pedigree(id,
                   fatherid, motherid, sex,
                   status=(cancer& !is.na(cancer)), affected=proband,
                   famid=famid))

set.seed(10)

nfam <- 6
breastped <- breastpeda[1:nfam]

 # Simulate a response

# Make dataset for lme4
df <- lapply(1:nfam, function(xx) {
            as.data.frame(breastped[xx])
            })

mydata <- do.call(rbind, df)
mydata$famid <- rep(1:nfam, times=unlist(lapply(df, nrow)))

y <- lapply(1:nfam, function(xx) {
            x <- breastped[xx]
            rmvtnorm.pedigree(1, x, h2=0.3, c2=0)
            })
yy <- unlist(y)

library(geepack)

geekin(yy ~ 1, id=mydata$famid, varlist=list(2*kinship(breastped)))

# lmekin(yy ~ 1 + (1|id), data=mydata, varlist=list(2*kinship(breastped)),method="REML")







