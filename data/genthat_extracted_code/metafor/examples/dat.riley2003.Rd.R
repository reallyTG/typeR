library(metafor)


### Name: dat.riley2003
### Title: Studies on MYC-N as a Prognostic Marker for Neuroblastoma
### Aliases: dat.riley2003
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.riley2003))

### random-effects model analysis for outcome DFS
res <- rma(yi, sei=sei, data=dat, subset=(outcome == "DFS"), method="DL")
res
predict(res, transf=exp, digits=2)

### random-effects model analysis for outcome OS
res <- rma(yi, sei=sei, data=dat, subset=(outcome == "OS"), method="DL")
res
predict(res, transf=exp, digits=2)



