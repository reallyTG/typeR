library(lmfor)


### Name: ImputeHeights
### Title: Impute missing tree heights into a forest data using a nonlinear
###   (mixed-effects) model.
### Aliases: ImputeHeights
### Keywords: forest biometrics

### ** Examples

data(spati) 

ImpFixed<-ImputeHeights(spati$d,spati$h,spati$plot,level=0)
ImpRandom<-ImputeHeights(spati$d,spati$h,spati$plot,level=1,makeplot=FALSE)
# Try also
# ImpRanRes<-ImputeHeights(spati$d,spati$h,spati$plot,level=1,addResidual=TRUE,makeplot=FALSE)

plot(spati$d[!is.na(spati$h)],
     spati$h[!is.na(spati$h)],
     col=spati$plot[!is.na(spati$h)],
     main="Observations", xlab="d, cm", ylab="h, m",
     ylim=c(0,30))

plot(spati$d[ImpFixed$imputed],
     ImpFixed$h[ImpFixed$imputed],
     col=spati$plot[ImpFixed$imputed],
     main="Imputed, Naslund, Fixed", xlab="d, cm", ylab="h, m",
     ylim=c(0,30))
       
plot(spati$d[ImpRandom$imputed],
     ImpRandom$h[ImpRandom$imputed],
     col=spati$plot[ImpRandom$imputed],
     main="Imputed, Naslund, Fixed + Plot", xlab="d, cm", ylab="h, m",
     ylim=c(0,30))

# Try also
# plot(spati$d[ImpRanRes$imputed],
#     ImpRanRes$h[ImpRanRes$imputed],
#     col=spati$plot[ImpRanRes$imputed],
#     main="Imputed, Naslund, Fixed + Plot + Tree", xlab="d, cm", ylab="h, m",
#     ylim=c(0,30))



