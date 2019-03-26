library(lava)


### Name: Combine
### Title: Report estimates across different models
### Aliases: Combine

### ** Examples

data(serotonin)
m1 <- lm(cau ~ age*gene1 + age*gene2,data=serotonin)
m2 <- lm(cau ~ age + gene1,data=serotonin)
m3 <- lm(cau ~ age*gene2,data=serotonin)

Combine(list(A=m1,B=m2,C=m3),fun=function(x)
     c("_____"="",R2=" "%++%format(summary(x)$r.squared,digits=2)))



