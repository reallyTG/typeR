library(agridat)


### Name: jansen.strawberry
### Title: Ordered disease ratings on strawberry crosses.
### Aliases: jansen.strawberry
### Keywords: datasets

### ** Examples


data(jansen.strawberry)
dat <- jansen.strawberry
dat <- transform(dat, category=ordered(category, levels=c('C1','C2','C3')))

dtab <- xtabs(count ~ male + female + category, data=dat)
ftable(dtab)

mosaicplot(dtab,
           color=c("lemonchiffon1","lightsalmon1","indianred"),
           main="jansen.strawberry disease ratings",
           xlab="Male parent", ylab="Female parent")

if(require(MASS) & require(vcd)){
  # Friendly suggests a minimal model is [MF][C]
  # m1 <- loglm( ~ 1*2 + 3, dtab) # Fails, only with devtools
  # mosaic(m1)
}




