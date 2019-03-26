library(IAbin)


### Name: plotNT.sup
### Title: Plotting N-T Plane for Decision on Performing an Interim
###   Analysis
### Aliases: plotNT.sup

### ** Examples

#--- Settings ---#
#--- With an expected parameter for control therapy ---#
p0 = 0.5
M = 135
q = 2/3
alpha1 = 0.01

#--- N-T plot for early stopping for superiority ---#
NT_s = plotNT.sup(p0, M, q, alpha1)
print(NT_s)

#--- Settings ---#
#--- With several expected parameters for control therapy ---#
p0 = c(0.2, 0.4, 0.6)
M = 135
q = 2/3
alpha1 = 0.01
col = c(1, 2, 3)

#--- N-T plot for early stopping for superiority ---#
NT_s3 = plotNT.sup(p0, M, q, alpha1, col=col)
print(NT_s3)




