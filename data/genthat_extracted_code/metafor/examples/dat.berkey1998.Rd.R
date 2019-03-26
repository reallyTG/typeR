library(metafor)


### Name: dat.berkey1998
### Title: Studies on Treatments for Periodontal Disease
### Aliases: dat.berkey1998
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.berkey1998))

### construct list of the variance-covariance matrices of the observed outcomes for the studies
V <- lapply(split(dat[,c("v1i", "v2i")], dat$trial), as.matrix)

### construct block diagonal matrix
V <- bldiag(V)

### fit multiple outcomes (meta-regression) model (with REML estimation)
res <- rma.mv(yi, V, mods = ~ outcome - 1, random = ~ outcome | trial, struct="UN", data=dat)
print(res, digits=3)

### test/estimate difference between the two outcomes
anova(res, L=c(1,-1))

### fit model including publication year as moderator for both outcomes (with ML estimation)
res <- rma.mv(yi, V, mods = ~ outcome + outcome:I(year - 1983) - 1,
              random = ~ outcome | trial, struct="UN", data=dat, method="ML")
print(res, digits=3)



