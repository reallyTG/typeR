library(statar)


### Name: xtile
### Title: Bin variable in groups (similar to Stata xtile)
### Aliases: xtile

### ** Examples

x <- c(NA, 1:10)                   
xtile(x, n = 3) # 3 groups based on terciles
xtile(x, probs = c(0.3, 0.7)) # 3 groups based on two quantiles
xtile(x, cutpoints = c(2, 3)) # 3 groups based on two cutpoints



