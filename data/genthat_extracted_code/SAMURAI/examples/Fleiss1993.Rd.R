library(SAMURAI)


### Name: Fleiss1993
### Title: Aspirin after Myocardial Infarction
### Aliases: Fleiss1993
### Keywords: datasets

### ** Examples

library(SAMURAI)
data(Fleiss1993)

forestsens(table=Fleiss1993, binary=TRUE, higher.is.better=FALSE)

# To assign all unpublished studies to each of ten outlooks, one at a time, 
# and then return a table of summary effects, their 95% confidence interval, 
# and tau-squared.
summtab <- forestsens(table=Fleiss1993, binary=TRUE, higher.is.better=FALSE, all.outlooks=TRUE)
summtab



