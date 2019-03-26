library(RobLox)


### Name: rlsOptIC.M
### Title: Computation of the optimally robust IC for M estimators
### Aliases: rlsOptIC.M
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.M(r = 0.1, check = TRUE)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1, NormLocationScaleFamily())
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25)
Risks(IC1)
Infos(IC1)
plot(IC1)
infoPlot(IC1)



