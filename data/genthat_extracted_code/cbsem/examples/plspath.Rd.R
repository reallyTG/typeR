library(cbsem)


### Name: plspath
### Title: Estimation of pls-path models
### Aliases: plspath

### ** Examples

data(mobi250)
refl <- c(1, 1, 1, 4, 4, 4, 2, 2, 2, 3, 3, 5, 5, 5, 6, 6, 6, 7, 1, 1, 4, 4, 4, 4)  
o <- order(refl)
dat <- mobi250[,o]
dat <- dat[,-ncol(dat)]
refl <- refl[o][-length(refl)] 
indicatorx <- refl[1:5]
indicatory <- refl[-c(1:5)] - 1
B <- matrix(c(0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,
              0,1,1,0,0,0,0,1,1,1,0,0,1,0,0,0,1,0),6,6,byrow=TRUE)  
out <- plspath(dat,B,indicatorx,indicatory,modex="A",modey="A")




