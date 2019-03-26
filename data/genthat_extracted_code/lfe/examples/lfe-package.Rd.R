library(lfe)


### Name: lfe-package
### Title: Overview. Linear Group Fixed Effects
### Aliases: lfe-package lfe
### Keywords: models regression

### ** Examples


  oldopts <- options(lfe.threads=1)
  x <- rnorm(1000)
  x2 <- rnorm(length(x))
  id <- factor(sample(10,length(x),replace=TRUE))
  firm <- factor(sample(3,length(x),replace=TRUE,prob=c(2,1.5,1)))
  year <- factor(sample(10,length(x),replace=TRUE,prob=c(2,1.5,rep(1,8))))
  id.eff <- rnorm(nlevels(id))
  firm.eff <- rnorm(nlevels(firm))
  year.eff <- rnorm(nlevels(year))
  y <- x + 0.25*x2 + id.eff[id] + firm.eff[firm] +
         year.eff[year] + rnorm(length(x))
  est <- felm(y ~ x+x2 | id + firm + year)
  summary(est)

  getfe(est,se=TRUE)
# compare with an ordinary lm
  summary(lm(y ~ x+x2+id+firm+year-1))
  options(oldopts)




