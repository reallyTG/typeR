library(agridat)


### Name: parker.orange.uniformity
### Title: Uniformity trial of oranges
### Aliases: parker.orange.uniformity
### Keywords: datasets

### ** Examples


data(parker.orange.uniformity)
dat <- parker.orange.uniformity

# Parker fig 2, field plan
if(require(desplot)){
  dat$year <- factor(dat$year)
  # 27 rows * 48 ft x 10 cols * 200 feet
  desplot(yield ~ col*row|year, data = dat,
          flip = TRUE, aspect = 27*48/(10*200), # true aspect
          main = "parker.orange.uniformity")
}

# CV across plots in each year. Similar to Parker table 11
cv <- function(x) {
  x <- na.omit(x)
  sd(x)/mean(x)
}
round(100*tapply(dat$yield, dat$year, cv),2)

# Correlation of plot yields across years. Similar to Parker table 15.
# Paker et al may have calculated correlation differently.
if(require(reshape2) & require(corrgram)){
  dat2 <- acast(dat, row+col ~ year, value.var = 'yield')
  round(cor(dat2, use = "pair"),3)
  corrgram(dat2, lower = panel.pts, upper = panel.conf,
           main="parker.orange.uniformity")
}

# Fertility index. Mean across years (ignoring 1921). Parker table 16
dat3 <- aggregate(yield ~ row+col, data = subset(dat, year !=1921 ),
                  FUN = mean, na.rm = TRUE)
round(acast(dat3, row ~ col, value.var = 'yield'),0)

if(require(desplot)){
  desplot(yield ~ col*row, data = dat3,
          flip = TRUE, aspect = 27*48/(10*200), # true aspect
          main = "parker.orange.uniformity - mean across years")
}




