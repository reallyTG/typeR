library(openintro)


### Name: satGPA
### Title: SAT and GPA data
### Aliases: satGPA
### Keywords: datasets

### ** Examples

data(satGPA)

par(mfrow=2:1)

plot(satGPA$SATSum/2, satGPA$FYGPA)
g <- lm(satGPA$FYGPA ~ I(satGPA$SATSum/2))
summary(g)
abline(g)

plot(satGPA$SATM, satGPA$FYGPA)
g <- lm(satGPA$FYGPA ~ satGPA$SATM)
summary(g)
abline(g)



