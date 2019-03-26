library(IAbin)


### Name: plotNT.fut
### Title: Plotting N-T Plane for Decision on Performing an Interim
###   Analysis
### Aliases: plotNT.fut

### ** Examples

#--- Settings ---#
#--- With an expected parameter for control therapy ---#
p0 = 0.5
M = 135
q = 2/3
alpha1 = 0.01
cp1 = 0.2

#--- N-T plot for early stopping for superiority and futility ---#
NT_f = plotNT.fut(p0, M, q, alpha1, cp1)
print(NT_f)

#--- Settings ---#
#--- With several expected parameters for control therapy ---#
p0 = c(0.2, 0.4, 0.6)
M = 135
q = 2/3
alpha1 = 0.01
col = c(1, 2, 3)
cp1 = 0.2

#--- N-T plot for early stopping for superiority and futility ---#
NT_f3 = plotNT.fut(p0, M, q, alpha1, cp1, col=col)
print(NT_f3)




