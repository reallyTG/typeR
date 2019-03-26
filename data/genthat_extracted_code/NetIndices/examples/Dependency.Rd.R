library(NetIndices)


### Name: Dependency
### Title: Direct and indirect dependency analysis
### Aliases: Dependency
### Keywords: utilities

### ** Examples
# The takapoto atoll network
Dependency(Takapoto, Import = "CO2",
           Export = c("CO2", "Sedimentation", "Grazing"))

# making "Bacteria" a "primary food source"  
TAK <- Takapoto
TAK[,"Bacteria"] <- c(0, 0, 0, 0, 0, 0, 1, 0)

# first two columns
DD <- Dependency(TAK, Import = c("CO2", "DOC"),
                 Export = c("CO2", "DOC", "Sedimentation", "Grazing"))
DD

barplot(t (DD[3:nrow(DD), 1:2]), beside = TRUE, ylab = "-",
       legend = c("Phytoplankton","Bacteria"),
       main = "dependency on (primary) food sources")



