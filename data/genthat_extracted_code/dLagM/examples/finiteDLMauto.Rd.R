library(dLagM)


### Name: finiteDLMauto
### Title: Find the optimal lag length for finite DLMs
### Aliases: finiteDLMauto

### ** Examples

library(dLagM)
# Only one independent series
data(warming)
# Run the search over polynomial DLMs according to MASE values
finiteDLMauto(x = warming$NoMotorVehicles , y = warming$Warming ,
              q.max = 11, k.order = 3, model.type = "poly",
              error.type = "MASE", trace = TRUE)

# Run the search over finite DLMs according to AIC values
finiteDLMauto(x = warming$NoMotorVehicles , y = warming$Warming , 
              q.min = 2, q.max = 8, model.type = "dlm", error.type = "AIC", 
              trace = TRUE)

# Multiple independent series
data(M1Germany)
data = M1Germany[1:144,]
# Run the search over finite DLMs according to AIC values
finiteDLMauto(formula = logprice ~ interest + logm1, 
              data = data.frame(data), q.min = 2, q.max = 14, 
              model.type = "dlm", error.type = "AIC", trace = TRUE)



