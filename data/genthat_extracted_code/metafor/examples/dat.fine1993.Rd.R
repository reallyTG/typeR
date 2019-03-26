library(metafor)


### Name: dat.fine1993
### Title: Studies on Radiation Therapy with or without Adjuvant
###   Chemotherapy in Patients with Malignant Gliomas
### Aliases: dat.fine1993
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.fine1993))

### calculate log(ORs) and sampling variances for each time point
dat <- escalc(measure="OR", ai=e1i, n1i=nei, ci=c1i, n2i=nci, data=dat, var.names=c("y1i","v1i"))
dat <- escalc(measure="OR", ai=e2i, n1i=nei, ci=c2i, n2i=nci, data=dat, var.names=c("y2i","v2i"))
dat <- escalc(measure="OR", ai=e3i, n1i=nei, ci=c3i, n2i=nci, data=dat, var.names=c("y3i","v3i"))
dat <- escalc(measure="OR", ai=e4i, n1i=nei, ci=c4i, n2i=nci, data=dat, var.names=c("y4i","v4i"))

### calculate the covariances (equations in Appendix of Trikalinos & Olkin, 2012)
dat$v12i <- with(dat, nei / (e1i * (nei - e2i)) + nci / (c1i * (nci - c2i)))
dat$v13i <- with(dat, nei / (e1i * (nei - e3i)) + nci / (c1i * (nci - c3i)))
dat$v14i <- with(dat, nei / (e1i * (nei - e4i)) + nci / (c1i * (nci - c4i)))
dat$v23i <- with(dat, nei / (e2i * (nei - e3i)) + nci / (c2i * (nci - c3i)))
dat$v24i <- with(dat, nei / (e2i * (nei - e4i)) + nci / (c2i * (nci - c4i)))
dat$v34i <- with(dat, nei / (e3i * (nei - e4i)) + nci / (c3i * (nci - c4i)))

### create dataset in long format
dat.long <- data.frame(study=rep(1:nrow(dat), each=4), time=1:4, 
                       yi=c(t(dat[,c("y1i","y2i","y3i","y4i")])),
                       vi=c(t(dat[,c("v1i","v2i","v3i","v4i")])))

### var-cov matrices of the sudies
V <- lapply(split(dat, dat$study), 
            function(x) matrix(c( x$v1i, x$v12i, x$v13i, x$v14i, 
                                 x$v12i,  x$v2i, x$v23i, x$v24i, 
                                 x$v13i, x$v23i,  x$v3i, x$v34i, 
                                 x$v14i, x$v24i, x$v34i,  x$v4i), nrow=4, ncol=4, byrow=TRUE))

### remove rows for the missing time points in study 17
dat.long <- na.omit(dat.long)

### remove corresponding rows/columns from var-cov matrix
V[[17]] <- V[[17]][c(2,4),c(2,4)]

### make a copy of V
Vc <- V

### replace any (near) singular var-cov matrices with ridge corrected versions
repl.Vi <- function(Vi) {
   res <- eigen(Vi)
   if (any(res$values <= .08)) {
      round(res$vectors %*% diag(res$values + .08) %*% t(res$vectors), 12)
   } else {
      Vi
   }
}
Vc <- lapply(Vc, repl.Vi)

### do not correct var-cov matrix of study 17
Vc[[17]] <- V[[17]]

### construct block diagonal matrix
Vc <- bldiag(Vc)

### multivariate fixed-effects model
res <- rma.mv(yi, Vc, mods = ~ factor(time) - 1, method="FE", data=dat.long)
print(res, digits=3)

### multivariate random-effects model with heteroscedastic AR(1) structure for the true effects
res <- rma.mv(yi, Vc, mods = ~ factor(time) - 1, random = ~ time | study,
              struct="HAR", data=dat.long)
print(res, digits=3)

## Not run: 
##D ### profile the variance components
##D par(mfrow=c(2,2))
##D profile(res, tau2=1, xlim=c( 0,.2))
##D profile(res, tau2=2, xlim=c( 0,.2))
##D profile(res, tau2=3, xlim=c( 0,.2))
##D profile(res, tau2=4, xlim=c(.1,.3))
## End(Not run)

## Not run: 
##D ### profile the autocorrelation coefficient
##D par(mfrow=c(1,1))
##D profile(res, rho=1)
## End(Not run)



