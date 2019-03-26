library(glmmboot)


### Name: GetRand
### Title: this takes in a formula with bars and gives back the plain names
###   of the columns
### Aliases: GetRand

### ** Examples

GetRand('y ~ age + (1 | school)')
GetRand('y ~ income + (1 | school) + (1 | school:section)')
GetRand('y ~ income + (1 | school) + (1 | school/section)')
GetRand(as.formula('y ~ x + (1 | z)'))
GetRand('y ~ x')



