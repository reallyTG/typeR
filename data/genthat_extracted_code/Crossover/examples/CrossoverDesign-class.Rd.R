library(Crossover)


### Name: CrossoverDesign-class
### Title: Class CrossoverDesign
### Aliases: CrossoverDesign CrossoverDesign-class
###   print,CrossoverDesign-method show,CrossoverDesign-method
### Keywords: graphs

### ** Examples



design <- t(rbind(c(1,1,2,2),
                  c(2,2,1,1),
                  c(1,1,2,2),
                  c(2,2,1,1),
                  c(1,2,2,1),
                  c(2,1,1,2)))
                   
new("CrossoverDesign", design)





