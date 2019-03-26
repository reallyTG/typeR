library(funnelR)


### Name: fundata
### Title: Compute Control Limits for Proportion Data
### Aliases: fundata

### ** Examples

#My sample data
my_data  <- data.frame(id=c('A','B','C','D','E'), n=c(2,5,10,15,18), d=c(20,20,20,20,20))

#Compute approximate control limits
my_fpdata <- fundata(my_data, alpha=0.95, alpha2=0.998, method='approximate', step=0.5)



