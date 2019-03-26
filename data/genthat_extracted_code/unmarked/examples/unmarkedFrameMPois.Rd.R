library(unmarked)


### Name: unmarkedFrameMPois
### Title: Organize data for the multinomial-Poisson mixture model of Royle
###   (2004) fit by multinomPois
### Aliases: unmarkedFrameMPois

### ** Examples


# Fake doulbe observer data
R <- 4 # number of sites
J <- 2 # number of observers

y <- matrix(c(
   1,0,3,
   0,0,0,
   2,0,1,
   0,0,2), nrow=R, ncol=J+1, byrow=TRUE)
y

site.covs <- data.frame(x1=1:4, x2=factor(c('A','B','A','B')))
site.covs

obs.covs <- list(
   x3 = matrix(c(
      -1,0,
      -2,0,
      -3,1,
       0,0), 
      nrow=R, ncol=J, byrow=TRUE),
   x4 = matrix(c(
      'a','b',
      'a','b',
      'a','b',
      'a','b'), 
      nrow=R, ncol=J, byrow=TRUE))
obs.covs


# Create unmarkedFrame
umf <- unmarkedFrameMPois(y=y, siteCovs=site.covs, obsCovs=obs.covs,
    type="double")
    
# The above is the same as:
o2y <- matrix(1, 2, 3)
pifun <- function(p)
{
    M <- nrow(p)
    pi <- matrix(NA, M, 3)
    pi[, 1] <- p[, 1] * (1 - p[, 2])
    pi[, 2] <- p[, 2] * (1 - p[, 1])
    pi[, 3] <- p[, 1] * p[, 2]
    return(pi)
}

umf <- unmarkedFrameMPois(y=y, siteCovs=site.covs, obsCovs=obs.covs,
    obsToY=o2y, piFun="pifun")


# Fit a model
fm <- multinomPois(~1 ~1, umf)






