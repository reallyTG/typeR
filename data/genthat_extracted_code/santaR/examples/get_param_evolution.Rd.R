library(santaR)


### Name: get_param_evolution
### Title: Compute the value of different fitting metrics over all possible
###   df for each eigenSpline
### Aliases: get_param_evolution

### ** Examples

## 8 subjects, 4 time-points, 3 variables
inputData <- acuteInflammation$data[0:32,1:3]
ind       <- acuteInflammation$meta$ind[0:32]
time      <- acuteInflammation$meta$time[0:32]
eigen     <- get_eigen_spline(inputData, ind, time, nPC=NA, scaling="scaling_UV",
                              method="nipals", verbose=TRUE, centering=TRUE, ncores=0)
# nipals calculated PCA
# Importance of component(s):
#                  PC1     PC2      PC3
# R2            0.9272 0.06606 0.006756
# Cumulative R2 0.9272 0.99324 1.000000
# total time: 0.02 secs
get_param_evolution(eigen, step=1)
# [[1]]
#                                  2           3          4
# Penalised_residuals(CV)  103.55727   141.55548 267.197267
# Penalised_residuals(GCV)  90.84612   122.03917 198.953021
# AIC                      185.57835    67.02707   8.000000
# BIC                      184.35094    65.18611   5.545177
# AICc                     197.57835 95464.81688 -32.000000
# 
# [[2]]
#                                   2            3          4
# Penalised_residuals(CV)   0.2257652 6.401150e-01   1.512174
# Penalised_residuals(GCV)  0.3034771 6.647154e-01   1.173309
# AIC                       4.6062841 6.331849e+00   8.000000
# BIC                       3.3788728 4.490887e+00   5.545177
# AICc                     16.6062865 9.540412e+04 -32.000000
# 
# [[3]]
#                                   2            3          4
# Penalised_residuals(CV)   0.8338811 9.171538e-01   1.484069
# Penalised_residuals(GCV)  0.6607046 7.148925e-01   1.105211
# AIC                       5.3094592 6.354912e+00   8.000000
# BIC                       4.0820479 4.513949e+00   5.545177
# AICc                     17.3094616 9.540414e+04 -32.000000




