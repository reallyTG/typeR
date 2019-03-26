library(bliss)


### Name: interpretation_plot
### Title: interpretation_plot
### Aliases: interpretation_plot

### ** Examples

data(data1)
data(param1)
# result of res_bliss1 <- fit_Bliss(data=data1,param=param1,verbose=TRUE)
data(res_bliss1)
interpretation_plot(data=data1,Bliss_estimate=res_bliss1$Bliss_estimate,q=1)
interpretation_plot(data=data1,Bliss_estimate=res_bliss1$Bliss_estimate,q=1,centered=TRUE)



