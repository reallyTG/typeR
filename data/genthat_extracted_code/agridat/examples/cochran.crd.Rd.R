library(agridat)


### Name: cochran.crd
### Title: Potato scab infection with sulfur treatments
### Aliases: cochran.crd
### Keywords: datasets

### ** Examples


data(cochran.crd)
dat <- cochran.crd

# Field plan
if(require(desplot)){
  desplot(inf~col*row, data=dat,
          text=trt, cex=1, # aspect unknown
          main="cochran.crd")
}

# CRD anova.  Table 6 of Tamura 1988
contrasts(dat$trt) <- cbind(c1=c(1,1,1,-6,1,1,1),   # Control vs Sulf
                            c2=c(-1,-1,-1,0,1,1,1)) # Fall vs Sp
m1 <- aov(inf ~ trt, data=dat)
anova(m1)
summary(m1, split=list(trt=list("Control vs Sulf"=1, "Fall vs Spring"=2)))

# Quadratic polynomial for columns...slightly different than Tamura 1988
m2 <- aov(inf ~ trt + poly(col,2), data=dat)
anova(m2)
summary(m2, split=list(trt=list("Control vs Sulf"=1, "Fall vs Spring"=2)))




