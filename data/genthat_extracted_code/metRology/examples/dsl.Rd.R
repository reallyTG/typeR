library(metRology)


### Name: derSimonian-Laird
### Title: derSimonian-Laird estimator
### Aliases: dsl dsl.default
### Keywords: univar

### ** Examples


  #PCB measurements in a sediment from Key Comparison CCQM-K25
  #s are reported standard uncertainties
  pcb105 <- data.frame(x=c(10.21, 10.9, 10.94, 10.58, 10.81, 9.62, 10.8),
               s=c(0.381, 0.250, 0.130, 0.410, 0.445, 0.196, 0.093))
               		
  with( pcb105, dsl(x, s) )




