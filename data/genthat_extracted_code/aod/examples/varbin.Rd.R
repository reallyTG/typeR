library(aod)


### Name: varbin
### Title: Mean, Variance and Confidence Interval of a Proportion
### Aliases: varbin show,varbin-class
### Keywords: htest

### ** Examples

  data(rabbits)
  varbin(n, y, rabbits[rabbits$group == "M", ])
  by(rabbits,
     list(group = rabbits$group),
     function(x) varbin(n = n, y = y, data = x, R = 1000))
  


