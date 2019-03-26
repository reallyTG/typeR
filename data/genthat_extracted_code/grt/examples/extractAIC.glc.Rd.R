library(grt)


### Name: extractAIC
### Title: extractAIC method for class 'glc', 'gqc', 'gcjc', and 'grg'
### Aliases: extractAIC.glc extractAIC.gqc extractAIC.grg extractAIC.gcjc
### Keywords: models

### ** Examples

data(subjdemo_2d)
#fit a 2d suboptimal model
fit.2dl <- glc(response ~ x + y, data=subjdemo_2d, 
    category=subjdemo_2d$category, zlimit=7)
extractAIC(fit.2dl)



