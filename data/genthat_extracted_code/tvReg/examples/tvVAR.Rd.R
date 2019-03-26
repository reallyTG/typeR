library(tvReg)


### Name: tvVAR
### Title: Time-varying Vector Autoregressive Models
### Aliases: tvVAR tvvar-class tvvar

### ** Examples

##Inflation rate, unemployment rate and treasury bill interest rate for 
##the US, as used in Primiceri (2005).
data(usmacro, package = "bvarsv")
model.VAR <- vars::VAR(usmacro, p = 6, type = "const")
model.tvVAR <- tvVAR(usmacro, p = 6, type = "const", bw = c(1.8, 20, 20))
plot(model.tvVAR)




