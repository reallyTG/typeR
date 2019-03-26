library(ILS)


### Name: Glucose
### Title: Glucose in Serum
### Aliases: Glucose
### Keywords: datasets

### ** Examples

library(ILS)
data(Glucose)
summary(Glucose)
attach(Glucose)
str(Glucose)
table(Replicate,Material,Laboratory)
table(Laboratory,Material)
st <- with(Glucose, tapply(Glucose, list(Material,Laboratory), mean))
st




