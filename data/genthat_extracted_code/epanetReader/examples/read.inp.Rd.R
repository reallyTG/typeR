library(epanetReader)


### Name: read.inp
### Title: Read .inp file
### Aliases: read.inp epanet.inp

### ** Examples

# path to Net1.inp example file included with this package
inp <- file.path( find.package("epanetReader"), "extdata","Net1.inp") 

#read the network file into R
n1 <- read.inp(inp)
summary(n1)
names(n1)
summary(n1$Junctions)
summary(n1$Pipes)
plot(n1) 



