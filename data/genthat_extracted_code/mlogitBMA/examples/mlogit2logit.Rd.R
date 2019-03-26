library(mlogitBMA)


### Name: mlogit2logit
### Title: Converting Multinomial Logit Data into Binary Logit Data
### Aliases: mlogit2logit
### Keywords: manip

### ** Examples

data(heating)
bin.data <- mlogit2logit(depvar ~ ic + oc, heating, choices=1:5, 
                         varying=3:12, sep='')
bin.glm <- glm(bin.data$formula, 'binomial', data=bin.data$data)
summary(bin.glm)



