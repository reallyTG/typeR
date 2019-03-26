library(rlme)


### Name: instruction
### Title: Instruction
### Aliases: instruction
### Keywords: datasets

### ** Examples


# The following code takes a few minutes to run.
# In the interest of saving CRAN's example testing time,
# it has been commented out. If you want to use it,
# just uncomment and run.

# data(instruction)
# attach(instruction)

# data = data.frame(
#   y = mathgain,
#   mathkind = mathkind, 
#   girl = girl,
#   minority = minority,
#   ses = ses, 
#   school = factor(schoolid), 
#   section = factor(classid))


# fit.rlme = rlme(y ~ 1 + mathkind + girl + minority + ses + (1 | school) + (1 | school:section),
#  data = data,
#  method = "gr")
  
# summary(fit.rlme)



