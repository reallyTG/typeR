library(soobench)


### Name: rotate_parameter_space
### Title: Rotate the parameter space of a SOO function.
### Aliases: rotate_parameter_space

### ** Examples

f <- ackley_function(2)
f_r <- rotate_parameter_space(f)
par(mfrow=c(1, 2))
plot(f)
plot(f_r)



