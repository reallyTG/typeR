library(lmridge)


### Name: plot.lmridge
### Title: VIF and Ridge Trace Plot
### Aliases: plot.lmridge plot
### Keywords: VIF trace ridge trace

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.15, 0.002))
## Ridge trace
plot(mod)
plot(mod, type = "ridge")

## VIF trace
plot(mod, type = "vif")
## Ridge trace without abline
plot(mod, type = "ridge", abline = FALSE)



