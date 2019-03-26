library(geepack)


### Name: genZcor
### Title: genZcor
### Aliases: genZcor humbelbee
### Keywords: regression

### ** Examples

#example to construct a Toeplitz correlation structure
#    sigma_ij=sigma_|i-j|

#data set with 5 clusters and maximally 4 observations (visits) per cluster
 gendat <- function() {
       id <- gl(5, 4, 20)
       visit <- rep(1:4, 5)
       y <- rnorm(id)
       dat <- data.frame(y, id, visit)[c(-2,-9),]
}

set.seed(88)
dat<-gendat()

#generating the design matrix for the unstructured correlation
zcor <- genZcor(clusz = table(dat$id), waves = dat$visit, corstrv=4)
# defining the Toeplitz structure 
zcor.toep<-matrix(NA, nrow(zcor),3)
zcor.toep[,1]<-apply(zcor[,c(1,4,6)],1,sum)
zcor.toep[,2]<-apply(zcor[,c(2,5)],1,sum)
zcor.toep[,3]<-zcor[,3]

zfit1 <- geese(y ~ 1,id = id, data = dat,
                   corstr = "userdefined", zcor = zcor.toep)


zfit2 <- geeglm(y ~ 1,id = id, data = dat,
                   corstr = "userdefined", zcor = zcor.toep)





