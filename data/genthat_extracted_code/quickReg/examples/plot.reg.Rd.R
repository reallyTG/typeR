library(quickReg)


### Name: plot.reg
### Title: plot the result of regression result
### Aliases: plot.reg plot_reg

### ** Examples

reg_glm<-reg(data = diabetes, y = 5, factor = c(1, 3, 4), model = 'glm')
plot(reg_glm)
plot(reg_glm, limits = c(NA, 3))




