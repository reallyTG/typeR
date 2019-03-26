library(agridat)


### Name: onofri.winterwheat
### Title: Yield of winter wheat varieties across 7 years.
### Aliases: onofri.winterwheat
### Keywords: datasets

### ** Examples

data(onofri.winterwheat)
dat <- onofri.winterwheat
dat <- transform(dat, year=factor(dat$year))

m1 <- aov(yield ~ year + block:year + gen + gen:year, dat)
anova(m1) # Matches Onofri figure 1

if(require(agricolae)){
  m2 <- AMMI(dat$year, dat$gen, dat$block, dat$yield)
  plot(m2)
  title("onofri.winterwheat - AMMI biplot")
}




