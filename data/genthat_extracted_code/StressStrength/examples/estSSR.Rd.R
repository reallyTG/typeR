library(StressStrength)


### Name: estSSR
### Title: Sample estimation of reliability of stress-strength models
### Aliases: estSSR
### Keywords: htest models

### ** Examples

# distributional parameters of X and Y
parx<-c(1, 1)
pary<-c(0, 2)
# sample sizes
n<-10
m<-20
# true value of R
SSR(parx,pary)
# draw independent random samples from X and Y
x<-rnorm(n, parx[1], parx[2])
y<-rnorm(m, pary[1], pary[2])
# build two-sided confidence intervals
estSSR(x, y, type="RG")
estSSR(x, y, type="AN")
estSSR(x, y, type="LOGIT")
estSSR(x, y, type="ARCSIN")
estSSR(x, y, type="B")
estSSR(x, y, type="B",B=1000) # change number of bootstrap replicates
# and one-sided
estSSR(x, y, type="RG", twoside=FALSE)
estSSR(x, y, type="AN", twoside=FALSE)
estSSR(x, y, type="LOGIT", twoside=FALSE)
estSSR(x, y, type="ARCSIN", twoside=FALSE)
estSSR(x, y, type="B", twoside=FALSE)
estSSR(x, y, type="GK", twoside=FALSE)
# changing sample sizes
n<-20
m<-30
x<-rnorm(n, parx[1], parx[2])
y<-rnorm(m, pary[1], pary[2])
# build tow-sided confidence intervals
estSSR(x, y, type="RG")
estSSR(x, y, type="AN")
estSSR(x, y, type="LOGIT")
estSSR(x, y, type="ARCSIN")
estSSR(x, y, type="B")



