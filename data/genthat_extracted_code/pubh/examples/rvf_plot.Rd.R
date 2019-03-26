library(pubh)


### Name: rvf_plot
### Title: Residual vs Fitted plot.
### Aliases: rvf_plot

### ** Examples

data(thuesen, package = "ISwR")
model <- lm(short.velocity ~ blood.glucose, data = thuesen)
plot(model, which = 1)
rvf_plot(model)



