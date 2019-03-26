library(mvabund)


### Name: traitglm
### Title: Fits a fourth corner model for abundance as a function of
###   environmental variables and species traits.
### Aliases: traitglm
### Keywords: models regression

### ** Examples

data(antTraits)

ft=traitglm(antTraits$abund,antTraits$env,antTraits$traits,method="manyglm")
ft$fourth #print fourth corner terms

# for a pretty picture of fourth corner coefficients, uncomment the following lines:
# library(lattice)
# a        = max( abs(ft$fourth.corner) )
# colort   = colorRampPalette(c("blue","white","red")) 
# plot.4th = levelplot(t(as.matrix(ft$fourth.corner)), xlab="Environmental Variables",
#   ylab="Species traits", col.regions=colort(100), at=seq(-a, a, length=100),
#   scales = list( x= list(rot = 45)))
# print(plot.4th)

plot(ft) # for a Dunn-smyth residual plot
qqnorm(residuals(ft)); abline(c(0,1),col="red") # for a normal quantile plot.

# predict to the first five sites
predict(ft,newR=antTraits$env[1:5,])

# refit using LASSO and less variables, including row effects and only two interaction terms:
ft1=traitglm(antTraits$abund,antTraits$env[,3:4],antTraits$traits[,c(1,3)],
      formula=~Shrub.cover:Femur.length+Shrub.cover:Pilosity,composition=TRUE,method="glm1path")
ft1$fourth #notice LASSO penalty has one interaction to zero




