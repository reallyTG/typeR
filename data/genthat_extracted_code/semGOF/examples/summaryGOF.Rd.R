library(semGOF)


### Name: summaryGOF
### Title: Goodness-of-Fit indexes in structural equation models for 'sem'
### Aliases: summaryGOF semGOF chisqNull chisqNull.objectiveML
###   print.summaryGOF
### Keywords: models

### ** Examples







# The following model has been created with
# six observed endogenous variables, 
# two unobserved endogenous variables and
# four unobserved exogenous variables.

S <- matrix(c(
        
1.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0,
0.6321,  1.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0,
0.5932,  0.5881,  1.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0,
0.0965,  0.0987,  0.1564,  1.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0,
0.1785,  0.1256,  0.1124,  0.4567,  1.0000,  0.0000,  0.0000,  0.0000,  0.0000,  0,
0.2135,  0.2003,  0.0762,  0.5589,  0.6097,  1.0000,  0.0000,  0.0000,  0.0000,  0,
0.3875,  0.4011,  0.3211,  0.0134,  0.0189,  0.0556,  1.0000,  0.0000,  0.0000,  0,
0.3569,  0.3989,  0.3301,  0.1323,  0.1036,  0.1132,  0.3215,  1.0000,  0.0000,  0,
0.1034,  0.1201,  0.1010,  0.2981,  0.3265,  0.2920,  0.1092,  0.0981,  1.0000,  0,
0.1324,  0.0622,  0.0123,  0.3056,  0.3525,  0.2661,  0.1234,  0.1207,  0.2221,  1
   
      ), ncol=10, byrow=TRUE)

rownames(S) <- c("Y1", "Y2", "Y3", "Y4", "Y5", "Y6", 
                 "CSI1", "CSI2", "CSI3", "CSI4")
colnames(S) <- c("Y1", "Y2", "Y3", "Y4", "Y5", "Y6",
                 "CSI1", "CSI2", "CSI3", "CSI4")



ram.I <- matrix(c(
#               heads   to      from    param  start
                1,       1,     11,      1,     NA, # lam1
                1,       2,     11,      0,     0.750,
                1,       3,     11,      2,     NA, # lam2
                1,       4,     12,      3,     NA, # lam3
                1,       5,     12,      4,     NA, # lam4
                1,       6,     12,      0,     0.800,
                1,      11,      7,      5,     NA, # gam1
                1,      11,      8,      6,     NA, # gam2
                1,      12,      9,      7,     NA, # gam3
                1,      12,     10,      8,     NA, # gam4
                2,       1,      1,      9,     NA, # theta1
                2,       2,      2,     10,     NA, # theta2
                2,       3,      3,     11,     NA, # theta3
                2,       4,      4,     12,     NA, # theta4
                2,       5,      5,     13,     NA, # theta5
                2,       6,      6,     14,     NA, # theta6
                2,      11,     11,     15,     NA, # psi1
                2,      12,     12,     16,     NA  # psi2
              
                ), ncol=5, byrow=TRUE)


params.I <- c('lam1', 'lam2', 'lam3', 'lam4', 'gam1', 'gam2', 
              'gam3', 'gam4', 'theta1', 'theta2', 'theta3',
              'theta4', 'theta5', 'theta6', 'psi1', 'psi2')

                 
vars.I <- c('Y1', 'Y2', 'Y3', 'Y4', 'Y5', 'Y6', 'CSI1',
             'CSI2', 'CSI3', 'CSI4', 'ETA1', 'ETA2')

                
sem.I <- sem(ram.I, S, 250, param.names=params.I,
             var.names=vars.I, fixed.x=7:10)



summaryGOF(sem.I)


# Goodness-of-Fit indexes of structural equation models for 'sem' package

# ICOMP =  -14.964
# Fml =  0.19582
# RNI =  0.97065
# IFI =  0.97133
# chisq.df =  1.6814
# CN =  231.91
# Gamma.hat =  0.98438
# BL86 =  0.89465
# W =  1.6814
# d =  0.079042
# Mc =  0.96125
# CAK =  0.27582
# CSK =  0.41668
# ECVI =  0.40466 



