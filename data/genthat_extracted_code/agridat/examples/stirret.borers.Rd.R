library(agridat)


### Name: stirret.borers
### Title: Corn borer control by application of fungal spores.
### Aliases: stirret.borers
### Keywords: datasets

### ** Examples


data(stirret.borers)
dat <- stirret.borers

require(lattice)
xyplot(count2~count1|trt,dat, main="stirret.borers - by treatment",
       xlab="Early count of borers", ylab="Late count")

# Even though the data are counts, Normal distribution seems okay
# qqmath(~count1|trt, dat, main="stirret.borers")

m1 <- lm(count1 ~ trt + block, dat)
anova(m1)

if(require(effects)){
  e1 <- effect('trt',m1)
  as.data.frame(e1)
  plot(e1, main="stirret.borer")
}




