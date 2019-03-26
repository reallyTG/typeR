library(agridat)


### Name: eden.potato
### Title: Potato yields in response to potash and nitrogen fertilizer
### Aliases: eden.potato
### Keywords: datasets

### ** Examples


data(eden.potato)
dat <- eden.potato

# 1925 qualitative
d5a <- subset(dat, year=='1925a')
if(require(desplot)){
  desplot(trt~col*row, d5a,
          text=yield, cex=1, shorten='no', # aspect unknown
          main="eden.potato: 1925 qualitative")
}
anova(m5a <- aov(yield~trt+factor(row)+factor(col), d5a)) # table 2

# 1926 qualitative
d6a <- subset(dat, year=='1926a')
if(require(desplot)){
  desplot(trt~col*row, d6a,
          text=yield, cex=1, shorten='no', # aspect unknown
          main="eden.potato: 1926 qualitative")
}
anova(m6a <- aov(yield~trt+factor(row)+factor(col), d6a)) # table 4

# 1925 quantitative
d5 <- subset(dat, year=='1925b')
if(require(desplot)){
  desplot(yield ~ col*row, d5,
          out1=block, text=trt, cex=1, # aspect unknown
          main="eden.potato: 1925 quantitative")
}
# Trt 't' not defined, seems to be the same as 'a'
require(lattice)
dotplot(trt~yield|block, d5,
        # aspect unknown
        main="eden.potato: 1925 quantitative")
anova(m5 <- aov(yield~trt+block, d5)) # table 6

# 1926 quantitative
d6 <- subset(dat, year=='1926b')
if(require(desplot)){
  desplot(yield ~ col*row, d6,
          out1=block, text=trt, cex=1, # aspect unknown
          main="eden.potato: 1926 quantitative")
}
anova(m6 <- aov(yield~trt+block, d6)) # table 7

# 1927 qualitative + quantitative
d7 <- droplevels(subset(dat, year==1927))
if(require(desplot)){
  desplot(yield ~ col*row, d7,
          out1=block, text=trt, cex=1, col=ptype, # aspect unknown
        main="eden.potato: 1927 qualitative + quantitative")
}

# Table 8.  Anova, mean yield tons / acre
anova(m7 <- aov(yield~trt+block+ptype + ptype:potash, d7))
if(require(reshape2)){
me7 <- melt(d7, measure.vars='yield')
acast(me7, potash~nitro, fun=mean) * 40/2240 # English ton = 2240 lbs
acast(me7, potash~ptype, fun=mean) * 40/2240
}




