library(mvabund)


### Name: Tasmania
### Title: Tasmania Dataset
### Aliases: Tasmania
### Keywords: datasets

### ** Examples

require(graphics)

data(Tasmania)
tasm.cop <- mvabund(Tasmania$copepods)
treatment <- Tasmania$treatment
block <- Tasmania$block

foo <- mvformula(tasm.cop~block*treatment)
plot(foo)




