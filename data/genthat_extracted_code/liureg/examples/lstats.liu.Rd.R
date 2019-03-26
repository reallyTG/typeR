library(liureg)


### Name: lstats.liu
### Title: Liu Regression Statistics
### Aliases: lstats lstats.liu print.lstats
### Keywords: Liu Regression Statistics

### ** Examples

mod<-liu(y~., data = as.data.frame(Hald), d = seq(-5, 5, 0.1), scaling = "centered")

lstats(mod)



