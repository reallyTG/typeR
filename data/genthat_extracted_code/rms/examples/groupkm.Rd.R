library(rms)


### Name: groupkm
### Title: Kaplan-Meier Estimates vs. a Continuous Variable
### Aliases: groupkm
### Keywords: survival nonparametric

### ** Examples

n <- 1000
set.seed(731)
age <- 50 + 12*rnorm(n)
cens <- 15*runif(n)
h <- .02*exp(.04*(age-50))
d.time <- -log(runif(n))/h
label(d.time) <- 'Follow-up Time'
e <- ifelse(d.time <= cens,1,0)
d.time <- pmin(d.time, cens)
units(d.time) <- "Year"
groupkm(age, Surv(d.time, e), g=10, u=5, pl=TRUE)
#Plot 5-year K-M survival estimates and 0.95 confidence bars by 
#decile of age.  If omit g=10, will have >= 50 obs./group.



