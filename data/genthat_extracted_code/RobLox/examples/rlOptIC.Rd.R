library(RobLox)


### Name: rlOptIC
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rlOptIC
### Keywords: robust

### ** Examples

IC1 <- rlOptIC(r = 0.1)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)
plot(IC1)



