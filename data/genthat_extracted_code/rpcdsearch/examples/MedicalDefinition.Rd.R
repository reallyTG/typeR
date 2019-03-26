library(rpcdsearch)


### Name: MedicalDefinition
### Title: Constructor function for MedicalDefinition class
### Aliases: MedicalDefinition

### ** Examples

def <- MedicalDefinition(terms = list(c("angina", "unstable"), c("angina", "Crescendo "),
                                      c("angina", "Refractory")),
                         codes = list("G33..00", "G330.00", "%r212H", "-G617"))
class(def)



