library(metafor)


### Name: dat.pignon2000
### Title: Studies on the Effectiveness of Locoregional Treatment plus
###   Chemotherapy for Head and Neck Squamous-Cell Carcinoma
### Aliases: dat.pignon2000
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.pignon2000))

### compute estimated log hazard ratios and sampling variances
dat$yi <- with(dat, OmE/V)
dat$vi <- with(dat, 1/V)

### meta-analysis based on all 65 trials
res <- rma(yi, vi, data=dat, method="FE", digits=2)
res
predict(res, transf=exp)

### only adjuvant trials
res <- rma(yi, vi, data=dat, method="FE", subset=grp==1, digits=2)
res
predict(res, transf=exp)

### only neoadjuvant trials
res <- rma(yi, vi, data=dat, method="FE", subset=grp==2, digits=2)
res
predict(res, transf=exp)

### only concomitant trials
res <- rma(yi, vi, data=dat, method="FE", subset=grp==3, digits=2)
res
predict(res, transf=exp)



