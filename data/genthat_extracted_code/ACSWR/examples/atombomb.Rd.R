library(ACSWR)


### Name: atombomb
### Title: Japanese atomic bomb survivors
### Aliases: atombomb
### Keywords: categorical data analysis

### ** Examples

data(atombomb)
atombombxtabs <- xtabs(Frequency~Radians+Count.Type+Count.Age.Group,data=atombomb)
atombombxtabs



