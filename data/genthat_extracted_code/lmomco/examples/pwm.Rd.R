library(lmomco)


### Name: pwm
### Title: Unbiased Sample Probability-Weighted Moments
### Aliases: pwm
### Keywords: probability-weighted moment (sample)

### ** Examples

# Data listed in Hosking (1995, table 29.2, p. 551)
H <- c(3,4,5,6,6,7,8,8,9,9,9,10,10,11,11,11,13,13,13,13,13,
       17,19,19,25,29,33,42,42,51.9999,52,52,52)
# 51.9999 was really 52, but a real non censored data point.
z <-  pwmRC(H,52,checkbetas=TRUE)
str(z)
# Hosking(1995) reports that A-type L-moments for this sample are
# lamA1=15.7 and lamAL-CV=.389, and lamAL-skew=.393
pwm2lmom(z$Abetas)
# WHA gets 15.666, 0.3959, and 0.4030

# See p. 553 of Hosking (1995)
# Data listed in Hosking (1995, table 29.3, p. 553)
D <- c(-2.982, -2.849, -2.546, -2.350, -1.983, -1.492, -1.443,
       -1.394, -1.386, -1.269, -1.195, -1.174, -0.854, -0.620,
       -0.576, -0.548, -0.247, -0.195, -0.056, -0.013,  0.006,
        0.033,  0.037,  0.046,  0.084,  0.221, 0.245, 0.296)
D <- c(D,rep(.2960001,40-28)) # 28 values, but Hosking mentions
                              # 40 values in total
z <-  pwmRC(D,.2960001)
# Hosking reports B-type L-moments for this sample are
# lamB1 = -.516 and lamB2 = 0.523
pwm2lmom(z$Bbetas)
# WHA gets -.5162 and 0.5218



