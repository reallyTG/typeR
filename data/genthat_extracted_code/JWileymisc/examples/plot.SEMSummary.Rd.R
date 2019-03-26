library(JWileymisc)


### Name: plot.SEMSummary
### Title: Plots SEMSummary object
### Aliases: plot.SEMSummary

### ** Examples

# default plot
plot(SEMSummary(~ ., data = mtcars))

# same as default
plot(SEMSummary(~ ., data = mtcars), plot = "coverage")

# shows p values
plot(SEMSummary(~ ., data = mtcars), plot = "p")

# shows correlations
plot(SEMSummary(~ ., data = mtcars), plot = "cor")



