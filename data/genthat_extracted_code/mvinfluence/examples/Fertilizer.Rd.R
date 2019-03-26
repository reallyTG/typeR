library(mvinfluence)


### Name: Fertilizer
### Title: Fertilizer Data
### Aliases: Fertilizer
### Keywords: datasets

### ** Examples

data(Fertilizer)

# simple plots
plot(Fertilizer, col=c('red', rep("blue",7)), cex=c(2,rep(1.2,7)), pch=as.character(1:8))
biplot(prcomp(Fertilizer))

#fit mlm
mod <- lm(cbind(grain, straw) ~ fertilizer, data=Fertilizer)
Anova(mod)

# influence plots (m=1)
influencePlot(mod)
influencePlot(mod, type='LR')
influencePlot(mod, type='stres')




