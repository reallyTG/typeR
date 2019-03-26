library(factoptd)


### Name: factoptd
### Title: Factorial optimal designs for two-colour cDNA microarray
###   experiments
### Aliases: factoptd factoptd.default print.factoptd
### Keywords: Factorial A-optimal designs Factorial D-optimal designs
###   Factorial E-optimal designs Microarray experiment

### ** Examples

  
  ##To obtain factorial A-optimal  design for a given
  ##design vector using 9 slides/arrays, set
  
  narys <- 9  #Number of arrays

  desvect = rbind(c(0,2,-2),c(-2,0,-2),
                c(-2,2,0),c(0,2,2),
                c(-2,0,2),c(-2,-2,0)) #Design vector

  Optcrit <- "A"   #Optimality criteria


  factoptdA <- factoptd(narys = 9, Optcrit = "A", desvect = 
                  rbind(c(0,2,-2),c(-2,0,-2),c(-2,2,0),c(0,2,2),c(-2,0,2),c(-2,-2,0)))

  
  print(factoptdA)




