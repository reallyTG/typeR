library(LIM)


### Name: LIMBrouageMudflat
### Title: Linear inverse model specification for the Intertidal mudflat
###   food web on the Atlantic coast of France
### Aliases: LIMBrouageMudflat
### Keywords: datasets

### ** Examples

Brouage <- Flowmatrix(LIMBrouageMudflat)
plotweb(Brouage, main = "Brouage mudflat food web", sub = "gC/m2/yr")
# Some ranges are infinite ->marked with "*
Plotranges(LIMBrouageMudflat, lab.cex = 0.7, sub = "*=unbounded",
           xlab = "gC/m2/year", main = "Brouage mudflat, Flowranges")
Plotranges(LIMBrouageMudflat, type = "V", lab.cex = 0.7, 
           sub = "*=unbounded",
           xlab = "gC/m2/year",main="Brouage mudflat, Variable ranges")



