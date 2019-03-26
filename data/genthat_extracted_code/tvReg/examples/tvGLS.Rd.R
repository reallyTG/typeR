library(tvReg)


### Name: tvGLS
### Title: Time-varying Generalised Least Squares
### Aliases: tvGLS tvGLS.list tvGLS.tvsure tvGLS.matrix

### ** Examples

data(FF5F)
x <- list()
## SMALL/LoBM porfolios time-varying three factor model
x[[1]] <- cbind(rep (1, 314), FF5F[, c("NA.Mkt.RF", "NA.SMB",  "NA.HML", "NA.RMW", "NA.CMA")])
x[[2]] <- cbind(rep (1, 314), FF5F[, c("JP.Mkt.RF", "JP.SMB",  "JP.HML", "JP.RMW", "JP.CMA")])
x[[3]] <- cbind(rep (1, 314), FF5F[, c("AP.Mkt.RF", "AP.SMB",  "AP.HML", "AP.RMW", "AP.CMA")])
x[[4]] <- cbind(rep (1, 314), FF5F[, c("EU.Mkt.RF", "EU.SMB",  "EU.HML", "EU.RMW", "EU.CMA")])
##Returns
y <- cbind(FF5F$NA.SMALL.LoBM, FF5F$JP.SMALL.LoBM, FF5F$AP.SMALL.LoBM, 
FF5F$EU.SMALL.LoBM) 
##Excess returns
y <- y - cbind(FF5F$NA.RF, FF5F$JP.RF, FF5F$AP.RF, FF5F$EU.RF)
##I fit the data with one bandwidth for each equation
ff5f.fit <- tvGLS(x = x, y = y, bw = c(1.03, 0.44, 0.69, 0.31))




