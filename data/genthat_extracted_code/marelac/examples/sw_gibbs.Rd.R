library(marelac)


### Name: sw_gibbs
### Title: Gibbs Function of Seawater
### Aliases: sw_gibbs
### Keywords: utilities

### ** Examples

# table 22 Feistel 2008
sw_gibbs(0, 0, 0)                             #= 101.34274
sw_gibbs(0, 0, 0, dS = 1)                     # 0
sw_gibbs(0, 0, 0, dt = 1)                     #0.147643376
sw_gibbs(0, 0, 0, dp = 1)                     #0.1000015694e-2
sw_gibbs(0, 0, 0, dS = 1, dp = 1)             #0
sw_gibbs(0, 0, 0, dt = 1, dp = 1)             #-0.677700318e-7

sw_gibbs(0, 79.85, 0)                         #-0.446114969e5 differs (see note)
sw_gibbs(0, 79.85, 0, dt = 1)                 #-0.107375993e4 differs
sw_gibbs(0, 79.85, 0, dp = 1)                 #0.102892956e-2 differs
sw_gibbs(0, 79.85, 0, dS = 1, dp = 1)         #0
sw_gibbs(0, 79.85, 0, dt = 1, dp = 1)         #0.659051552e-6


sw_gibbs(0, 0, 998.98675)                     #0.977303862e5
sw_gibbs(0, 0, 998.98675, dt = 1)             #0.851466502e1
sw_gibbs(0, 0, 998.98675, dp = 1)             #0.956683329e-3
sw_gibbs(0, 0, 998.98675, dS = 1, dp = 1)     #0
sw_gibbs(0, 0, 998.98675, dt = 1, dp = 1)     #0.199079571e-6

# table 21 Feistel 2008
sw_gibbs(35.16504, 0, 0)                      #=0
sw_gibbs(35.16504, 0, 0, dS = 1)              #0.639974067e2      differs
sw_gibbs(35.16504, 0, 0, dt = 1)              #=0
sw_gibbs(35.16504, 0, 0, dp = 1)              #0.972661217e-3
sw_gibbs(35.16504, 0, 0, dS = 1, dp = 1)      #-0.759615412e-6
sw_gibbs(35.16504, 0, 0, dt = 1, dp = 1)      #0.515167556e-7    !!!

sw_gibbs(100, 79.85, 0)                       #=-0.295243229e5   differs
sw_gibbs(100, 79.85, 0, dS = 1)               #0.251957276e3
sw_gibbs(100, 79.85, 0, dt = 1)               #-0.917529024e3    differs
sw_gibbs(100, 79.85, 0, dp = 1)               #0.971006828e-3    differs
sw_gibbs(100, 79.85, 0, dS = 1, dp = 1)       #-0.305957802e-6
sw_gibbs(100, 79.85, 0, dt = 1, dp = 1)       #0.146211315e-5

sw_gibbs(35.16504, 0, 998.98675)                 #=0.951294557e5
sw_gibbs(35.16504, 0, 998.98675, dS = 1)         #-0.545861581e1
sw_gibbs(35.16504, 0, 998.98675, dt = 1)         #0.160551219e2
sw_gibbs(35.16504, 0, 998.98675, dp = 1)         #0.933770945e-3
sw_gibbs(35.16504, 0, 998.98675, dS = 1, dp = 1) #-0.640757619e-6
sw_gibbs(35.16504, 0, 998.98675, dt = 1, dp = 1) #0.245708012e-6




