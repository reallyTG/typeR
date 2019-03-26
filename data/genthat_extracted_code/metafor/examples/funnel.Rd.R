library(metafor)


### Name: funnel
### Title: Funnel Plots
### Aliases: funnel funnel.rma funnel.default
### Keywords: hplot

### ** Examples

### load BCG vaccine data
dat <- get(data(dat.bcg))

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat)

### random-effects model
res <- rma(yi, vi, data=dat)

### standard funnel plot
funnel(res)

### show risk ratio values on x-axis (log scale)
funnel(res, atransf=exp)

### passing log risk ratios and sampling variances directly to the function
### note: essentially the same plot, except that reference line is centered at zero
funnel(dat$yi, dat$vi)
funnel(res, refline=0)

### funnel plot with risk ratio values on the x-axis
funnel(res, atransf=exp, at=log(c(.12, .25, .5, 1, 2)))

### contour-enhanced funnel plot centered at 0 (see Peters et al., 2008)
funnel(res, level=c(90, 95, 99), shade=c("white", "gray", "darkgray"),
       refline=0, atransf=exp, at=log(c(.10, .25, .5, 1, 2, 4, 10)))

### mixed-effects model with absolute latitude in the model
res <- rma(yi, vi, mods = ~ ablat, data=dat)

### funnel plot of the residuals
funnel(res)

### simulate a large meta-analytic dataset (correlations with rho = 0.2)
### with no heterogeneity or publication bias; then try out different
### versions of the funnel plot

gencor <- function(rhoi, ni) {
   x1 <- rnorm(ni, mean=0, sd=1)
   x2 <- rnorm(ni, mean=0, sd=1)
   x3 <- rhoi*x1 + sqrt(1-rhoi^2)*x2
   cor(x1, x3)
}

k  <- 200                               ### number of studies to simulate
ni <- round(rchisq(k, df=2) * 20 + 20)  ### simulate sample sizes (skewed distribution)
ri <- mapply(gencor, rep(0.2,k), ni)    ### simulate correlations

res <- rma(measure="ZCOR", ri=ri, ni=ni, method="FE") ### use r-to-z transformed correlations

funnel(res, yaxis="sei")
funnel(res, yaxis="vi")
funnel(res, yaxis="seinv")
funnel(res, yaxis="vinv")
funnel(res, yaxis="ni")
funnel(res, yaxis="ninv")
funnel(res, yaxis="sqrtni")
funnel(res, yaxis="sqrtninv")
funnel(res, yaxis="lni")
funnel(res, yaxis="wi")



