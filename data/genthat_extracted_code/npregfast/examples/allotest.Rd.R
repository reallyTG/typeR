library(npregfast)


### Name: allotest
### Title: Bootstrap based test for testing an allometric model
### Aliases: allotest

### ** Examples

library(npregfast)
data(barnacle)
allotest(DW ~ RC, data = barnacle, nboot = 50, seed = 130853, 
cluster = FALSE)




