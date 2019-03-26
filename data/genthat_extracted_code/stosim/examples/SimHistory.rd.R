library(stosim)


### Name: SimHistory
### Title: Simulation History creation.
### Aliases: SimHistory
### Keywords: model engine

### ** Examples

plantA_DF <- EventElement("generic.pump",1,101,"E", 28260,0,0,"N",8,2,0,87)
## note simulation drastically reduced for example run
PlantA <- SimHistory(plantA_DF,100,100)



