library(nutshell)


### Name: mort06.smpl
### Title: US Mortality Data, 2006
### Aliases: mort06.smpl
### Keywords: datasets

### ** Examples

data(mort06.smpl)
aov(age~Cause,data=mort06.smpl)
model.tables(aov(age~Cause, data=mort06.smpl))



