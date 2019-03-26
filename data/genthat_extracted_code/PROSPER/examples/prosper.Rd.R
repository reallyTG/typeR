library(PROSPER)


### Name: prosper
### Title: Creation of a PROSPER object
### Aliases: prosper
### Keywords: internal

### ** Examples

## No test: 
require(data.table)
struc_preparation(Rmx=10, n_loci=2, epis=0, dom=c(1,0.3))
simdata <- as.data.table(dfgenotype)
   simdata[,"repetition":=1]
   simdata[,"simcycle":=1]
   setcolorder(simdata, c(c("repetition", "simcycle"),
   colnames(simdata)[!(colnames(simdata) %in%
   c("simulation_run", "repetition", "simcycle"))])) 
prosper(simstruc = c(5,10), loci=2, simData = simdata)  
## End(No test)




