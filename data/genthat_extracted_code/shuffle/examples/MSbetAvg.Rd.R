library(shuffle)


### Name: MSbetAvg
### Title: Calculate Mean-square-between
### Aliases: MSbetAvg

### ** Examples

data(fMRI_responses,design_vec)

msbet = MSbetAvg(fMRI_responses[1,], getAveraging(design_vec))

# Compute same value using "aov" when design is balanced ... 
ns =tapply(design_vec,design_vec, length)
# (check that design is balanced)
stopifnot(length(unique(ns))==1)

m = length(unique(design_vec))

aov_sum = summary(aov(fMRI_responses[1,] ~ factor(design_vec)))
ss_bet = aov_sum[[1]][1,2]
# In unbalanced designs, each example should require more care...
msbet_aov = (ss_bet / ns[1] )/(m-1) 

cat(msbet, msbet_aov)




