library(pim)


### Name: classes
### Title: Extract information from pim.environment and pim.poset objects
### Aliases: classes names compare model link
###   classes,pim.environment-method names,pim.environment-method
###   names,pim.poset-method compare compare,pim.environment-method
###   compare,pim.poset-method model model,pim-method
###   model,pim.summary-method link link,pim-method link,pim.summary-method

### ** Examples

data(DysData)
DysPimEnv <- new.pim.env(DysData,poset=TRUE)
classes(DysPimEnv)
names(DysPimEnv)
compare(DysPimEnv)

themodel <- pim(SPC_D2 ~ Chemo, data = DysData, model = 'difference')
model(themodel)
thesummary <- summary(themodel)
model(thesummary)




