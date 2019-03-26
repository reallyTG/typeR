library(PowerTOST)


### Name: CI.BE
### Title: 1-2*alpha confidence interval given point estimate, CV, and n
### Aliases: CI.BE

### ** Examples

# 90% confidence interval for the 2x2 crossover
# n(total) = 24
CI.BE(pe=0.95, CV=0.3, n=24)
# should give
#     lower     upper 
# 0.8213465 1.0988055 
# same total number but unequal sequences
CI.BE(pe=0.95, CV=0.3, n=c(13, 11))
#     lower     upper
# 0.8209294 1.0993637   



