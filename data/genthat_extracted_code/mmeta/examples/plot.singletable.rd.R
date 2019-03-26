library(mmeta)


### Name: plot.singletable
### Title: Plot Method for 'singletable' objects
### Aliases: plot.singletable
### Keywords: singletable

### ** Examples

# Inference under Jeffreys prior distribution
#single.OR.Jeffreys <- singletable(a1=0.5, b1=0.5, a2=0.5,
#                                  b2=0.5, y1=40, n1=96, y2=49, n2=109,
#                                  model="Independent",
#                                  measure="OR", method="exact")
#summary(single.OR.Jeffreys)

# Inference under Laplace prior distribution
#single.OR.Laplace <- singletable(a1=1, b1=1, a2=1, b2=1,
#                                 y1=40, n1=96, y2=49, n2=109,
#                                 model="Independent", measure="OR",
#                                 method="exact")
# Inference under Sarmanov prior distribution with positive correlation
#single.OR.Sar1 <- singletable(a1=0.5, b1=0.5, a2=0.5, b2=0.5,
#                              rho=0.5, y1=40, n1=96, y2=49, n2=109,
#                              model="Sarmanov",
#                              measure="OR", method="exact")
# Inference under Sarmanov prior distribution with negative correlation
#single.OR.Sar2 <- singletable(a1=0.5, b1=0.5, a2=0.5, b2=0.5,
#                              rho=-0.5, y1=40, n1=96, y2=49, n2=109,
#                              model="Sarmanov",
#                              measure="OR", method="exact")
# generate a 2X2 panel plot
#par(mfrow=c(2,2))
#plot(single.OR.Jeffreys, type="overlap", xlim=c(0.5, 2),
#    main="Jefferys Prior")
#plot(single.OR.Laplace, type="overlap", xlim=c(0.5, 2),
 #    main="Laplace Prior")
#plot(single.OR.Sar1, type="overlap", xlim=c(0.5, 2),
#     main=expression(paste("Sarmanov Prior ",rho," = 0.5")))
#plot(single.OR.Sar2, type="overlap", xlim=c(0.5, 2),
#     main=expression(paste("Sarmanov Prior ",rho," = -0.5")))



