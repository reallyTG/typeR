library(evt0)


### Name: PORT.Hill
### Title: Peaks over random threshold Hill estimate
### Aliases: PORT.Hill PORT.MOP PORT.RBMOP
### Keywords: quasi-reduced bias PORT Hill

### ** Examples

# generate random samples               
x = rfrechet(50000, loc = 0, scale = 1,shape = 1/0.5)

# estimate PORT Hill 
PORT.Hill(x,c(1,500,5000),0.1,"PRBMOP")



