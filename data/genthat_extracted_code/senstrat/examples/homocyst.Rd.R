library(senstrat)


### Name: homocyst
### Title: Homocysteine levels in daily smokers and never smokers.
### Aliases: homocyst
### Keywords: datasets

### ** Examples

data(homocyst)
#Homocysteine levels for daily smokers and nonsmokers.
boxplot(log(homocyst$homocysteine)~homocyst$z)



