library(copBasic)


### Name: COP
### Title: The Copula
### Aliases: COP
### Keywords: copula (formulas) copula operator joint probability copula
###   (conditional distribution) copula (conditional quantile function)
###   copula (reflection)

### ** Examples

u <- runif(1); v <- runif(1)
COP(cop=W,u,v); COP(cop=P,u,v); COP(cop=M,u,v); COP(cop=PSP,u,v)

F <- 0.75 # 75th percentile, nonexceedance
G <- 0.20 # 25th percentile, nonexceedance
bF <- 1 - F; bG <- 1 - G      # exceedance
# What is the probability that both X and Y are less than
# 75th and 20th percentiles, respectively?
COP(cop=P,F,G)      # 0.15
# What is the probability that both X and Y are greater than
# 75th and 20th percentiles, respectively?
surCOP(cop=P,bF,bG) # 0.20
# What is the probability that either X or Y are less than
# the 75th and 20th percentiles, respectively?
duCOP(cop=P,F,G)    # 0.8
# What is the probability that either X or Y are greater than
# the 75th and 20th percentiles, respectively?
coCOP(cop=P,bF,bG)  # 0.85

# Repeat for the PSP copula:
# What is the probability that both X and Y are less than
# 75th and 20th percentiles, respectively?
COP(cop=PSP,F,G)      # 0.1875
# What is the probability that both X and Y are greater than
# 75th and 20th percentiles, respectively?
surCOP(cop=PSP,bF,bG) # 0.2375
# What is the probability that either X or Y are less than
# the 75th and 20th percentiles, respectively?
duCOP(cop=PSP,F,G)    # 0.7625
# What is the probability that either X or Y are greater than
# the 75th and 20th percentiles, respectively?
coCOP(cop=PSP,bF,bG)  # 0.8125
# Both of these summations equal unity
   COP(cop=PSP,  F,  G) + coCOP(cop=PSP, bF, bG) # 1
surCOP(cop=PSP, bF, bG) + duCOP(cop=PSP,  F,  G) # 1

F <- 0.99 # 99th percentile, nonexceedance
G <- 0.50 # 50th percentile, nonexceedance
bF <- 1 - F # nonexceedance
bG <- 1 - G # nonexceedance
# What is the probability that both X and Y are less than
# 99th and 50th percentiles, respectively?
COP(cop=P,F,G)      # 0.495
# What is the probability that both X and Y are greater than
# 99th and 50th percentiles, respectively?
surCOP(cop=P,bF,bG) # 0.005
# What is the probability that either X or Y are less than
# the 99th and 50th percentiles, respectively?
duCOP(cop=P,F,G)    # 0.995
# What is the probability that either X or Y are greater than
# the 99th and 50th percentiles, respectively?
coCOP(cop=P,bF,bG)  # 0.505



