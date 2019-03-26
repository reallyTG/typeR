library(metafor)


### Name: dat.begg1989
### Title: Studies on Bone-Marrow Transplantation versus Chemotherapy for
###   the Treatment of Leukemia
### Aliases: dat.begg1989
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.begg1989))

### turn trt and arms into factors and set reference levels
dat$trt  <- relevel(factor(dat$trt), ref="CMO")
dat$arms <- relevel(factor(dat$arms), ref="2")

### create data frame with the treatment differences for the controlled studies
dat2 <- data.frame(yi = dat$yi[c(1,3,5,7)] - dat$yi[c(2,4,6,8)],
                   vi = dat$vi[c(1,3,5,7)] + dat$vi[c(2,4,6,8)])

### DerSimonian and Laird method using the treatment differences
res <- rma(yi, vi, data=dat2, method="DL", digits=2)
res

### Begg & Pilote (1991) model incorporating the uncontrolled studies
res <- rma.mv(yi, vi, mods = ~ trt, random = ~ 1 | study,
              data=dat, method="ML", digits=2)
res

### model involving bias terms for the uncontrolled studies
res <- rma.mv(yi, vi, mods = ~ trt + trt:arms, random = ~ 1 | study,
              data=dat, method="ML", digits=2)
res

### model with random treatment effect
res <- rma.mv(yi, vi, mods = ~ trt, random = list(~ 1 | study, ~ trt | study),
              struct="UN", tau2=c(0,NA), rho=0, data=dat, method="ML", digits=2)
res

### model with random treatment effect, but with equal variances in both arms
res <- rma.mv(yi, vi, mods = ~ trt, random = list(~ 1 | study, ~ trt | study),
              struct="CS", rho=0, data=dat, method="ML", digits=2)
res



