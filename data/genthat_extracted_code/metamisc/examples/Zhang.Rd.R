library(metamisc)


### Name: Zhang
### Title: Meta-analysis of the prognostic role of hormone receptors in
###   endometrial cancer
### Aliases: Zhang
### Keywords: datasets

### ** Examples

data(Zhang)

# Display the hazard ratios for overall survival in a forest plot
ds <- subset(Zhang, outcome=="OS")
with(ds, forest(theta = HR, theta.ci.lb = HR.025, theta.ci.ub = HR.975, 
                theta.slab = Study, xlab = "Hazard ratio of HER2 versus OS", refline = 1))



