library(arm)


### Name: multicomp.plot
### Title: Multiple Comparison Plot
### Aliases: multicomp.plot mcplot
### Keywords: hplot

### ** Examples

old.par <- par(no.readonly = TRUE)

# example 1
simulation.array <- data.frame(coef1=rnorm(100,10,2), coef2=rnorm(100,5,2),
                      coef3=rnorm(100,0,1), coef4=rnorm(100,-5,3),
                      coef5=rnorm(100,-2,1))
short.lab <- c("c01", "c02", "c03", "c04", "c05")
multicomp.plot(simulation.array[,1:4], label.as.shortlabel=TRUE)

# wraper for multicomp.plot
mcplot(simulation.array, shortlabel = short.lab)

# example 2
data(lalonde)
M1 <- lm(re78 ~ treat + re74 + re75 + age + educ + u74 + u75, data=lalonde)
M1.sim <- sim(M1)
lm.sim <- coef(M1.sim)[,-1]
multicomp.plot(lm.sim, label.as.shortlabel=TRUE, label.on.which.axis=2)

par(old.par)



