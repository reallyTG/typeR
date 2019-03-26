library(MachineShop)


### Name: modelinfo
### Title: Display Model Information
### Aliases: modelinfo

### ** Examples

## All models
modelinfo()

## Models by response types
names(modelinfo(factor(0)))
names(modelinfo(factor(0), numeric(0)))




