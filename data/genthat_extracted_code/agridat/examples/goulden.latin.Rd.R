library(agridat)


### Name: goulden.latin
### Title: Latin square experiment for testing fungicide
### Aliases: goulden.latin
### Keywords: datasets

### ** Examples


data(goulden.latin)
dat <- goulden.latin

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          text=trt, cex=1, # aspect unknown
          main="goulden.latin")
}

# Matches Goulden.
m1 <- lm(yield~ trt + factor(row) + factor(col), data=dat)
anova(m1)




