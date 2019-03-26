library(deTestSet)


### Name: vdpol
### Title: van der Pol Equation, Nonlinear Vacuum Tube Circuit, ODE
### Aliases: vdpol
### Keywords: utilities

### ** Examples

out <- vdpol()
plot(out, lwd = 2, which = 1)

# compare to reference solution
out[nrow(out),-1] - reference("vdpol")




