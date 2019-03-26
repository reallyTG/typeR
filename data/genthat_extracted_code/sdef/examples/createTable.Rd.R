library(sdef)


### Name: createTable
### Title: Function to create an output table
### Aliases: createTable

### ** Examples

data = simulation(n=500,GammaA=1,GammaB=1,r1=0.5,r2=0.8,
DEfirst=300,DEsecond=200,DEcommon=100)
Th<- ratio(data=data$Pval)
Rh<- baymod(iter=100,output.ratio=Th)
output.table <- createTable(output.ratio=Th,output.bay=Rh)




