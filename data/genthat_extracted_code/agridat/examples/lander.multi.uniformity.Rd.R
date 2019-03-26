library(agridat)


### Name: lander.multi.uniformity
### Title: Uniformity trials of wheat and chari, 4 years on the same land.
### Aliases: lander.multi.uniformity
### Keywords: datasets

### ** Examples

data(lander.multi.uniformity)
dat <- lander.multi.uniformity

# Yearly means, similar to Lander table 7
## filter(dat) %>% group_by(year) %>% summarise(yld=mean(yield))
## 1 1929   18.1
## 2 1930   58.3
## 3 1931   22.8
## 4 1932   14.1

# heatmaps for all years
if(require(desplot)){
  dat$year <- factor(dat$year)
  desplot(yield ~ col*row|year, dat,
          flip=TRUE, aspect=(1037.1/939.12),
          main="lander.multi.uniformity")
}




