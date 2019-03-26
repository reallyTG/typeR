library(ILS)


### Name: IDT
### Title: Dataset composed of the initial decomposition temperature (IDT)
###   of different samples of Calcium Oxalate, obtained by 7 different
###   laboratories
### Aliases: IDT

### ** Examples

library(ILS)
data(IDT)
summary(IDT)
attach(IDT)
str(IDT)
table(Sample,Run,Laboratory)
table(Laboratory,Run)
st <- with(IDT, tapply(IDT, list(Run,Laboratory), mean))
st



