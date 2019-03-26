library(tsDyn)


### Name: LINEAR
### Title: Linear AutoRegressive models
### Aliases: LINEAR linear print.linear summary.linear print.summary.linear
### Keywords: ts

### ** Examples

#fit an AR(2) model
mod.linear <- linear(log(lynx), m=2)
mod.linear
summary(mod.linear)



