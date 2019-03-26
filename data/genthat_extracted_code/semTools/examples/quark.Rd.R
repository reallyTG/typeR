library(semTools)


### Name: quark
### Title: Quark
### Aliases: quark

### ** Examples


set.seed(123321)

dat <- HolzingerSwineford1939[,7:15]
misspat <- matrix(runif(nrow(dat) * 9) < 0.3, nrow(dat))
dat[misspat] <- NA
dat <- cbind(HolzingerSwineford1939[,1:3], dat)
## Not run: 
##D quark.list <- quark(data = dat, id = c(1, 2))
##D 
##D final.data <- combinequark(quark = quark.list, percent = 80)
##D 
##D ## Example to rerun quark after imputation failure:
##D quark.list <- quark(data = dat, id = c(1, 2), order = 2)
## End(Not run)




