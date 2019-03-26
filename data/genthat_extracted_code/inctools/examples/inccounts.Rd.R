library(inctools)


### Name: inccounts
### Title: Incidence and incidence difference statistics from trinomial
###   counts of HIV and recency
### Aliases: inccounts

### ** Examples

inccounts(N = c(5000) ,N_H = 1000, N_testR = 1000, N_R = 70,
Boot = FALSE, BMest = 'MDRI.FRR.indep', MDRI = 200, RSE_MDRI = 0.05,
FRR = 0.01, RSE_FRR = 0.2, BigT = 730)


inccounts(N = c(4000,4000,4050) ,N_H = c(1010,1000,900),
N_testR = c(1000,1000,880), N_R = c(60,70,50), Boot = TRUE,
BMest = 'same.test', MDRI = 210, RSE_MDRI = 0.05, FRR = 0.005,
RSE_FRR = 0.19, BigT = 700)


inccounts(N = c(4000,4000) ,N_H = c(1050,1090),
N_testR = c(1000,1000), N_R = c(60,67), Boot = FALSE, BMest = 'FRR.indep',
MDRI = 220, RSE_MDRI = 0.05, FRR = c(0.005,0.005), RSE_FRR = 0.19,
BigT = 610)




