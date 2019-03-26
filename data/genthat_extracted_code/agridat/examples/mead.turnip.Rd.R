library(agridat)


### Name: mead.turnip
### Title: Density/spacing experiment for turnips in 3 blocks.
### Aliases: mead.turnip
### Keywords: datasets

### ** Examples

data(mead.turnip)
dat <- mead.turnip

dat$ratef <- factor(dat$density)
dat$widthf <- factor(dat$spacing)

m1 <- aov(yield ~ block + ratef + widthf + ratef:widthf, data=dat)
anova(m1) # table 12.10 in Mead

# Similar to Piepho fig 10
if(require(lattice)) {
  xyplot(yield ~ log(spacing)|ratef, data=dat,
         auto.key=list(columns=5),
         main="mead.turnip - log(yield) for each density",
         group=ratef)
}



