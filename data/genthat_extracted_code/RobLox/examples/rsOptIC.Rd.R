library(RobLox)


### Name: rsOptIC
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rsOptIC
### Keywords: robust

### ** Examples

IC1 <- rsOptIC(r = 0.1)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)



