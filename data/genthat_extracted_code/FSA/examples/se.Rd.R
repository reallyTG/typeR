library(FSA)


### Name: se
### Title: Computes standard error of the mean.
### Aliases: se
### Keywords: manip

### ** Examples

x <- 1:20
sd(x)/sqrt(length(x))
se(x)

# all return NA if missing values are not removed
x2 <- c(x,NA)
sd(x2)/sqrt(length(x2))

# Better if missing values are removed
se(x2,na.rm=FALSE)
sd(x2,na.rm=TRUE)/sqrt(length(x2[complete.cases(x2)]))
se(x2)




