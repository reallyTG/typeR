library(genridge)


### Name: Acetylene
### Title: Acetylene Data
### Aliases: Acetylene
### Keywords: datasets

### ** Examples

data(Acetylene)

# naive model, not using centering
amod0 <- lm(yield ~ temp + ratio + time + I(time^2) + temp:time, data=Acetylene)

y <- Acetylene[,"yield"]
X0 <- model.matrix(amod0)[,-1]

lambda <- c(0, 0.0005, 0.001, 0.002, 0.005, 0.01)
aridge0 <- ridge(y, X0, lambda=lambda)

traceplot(aridge0)
traceplot(aridge0, X="df")
pairs(aridge0, radius=0.2)





