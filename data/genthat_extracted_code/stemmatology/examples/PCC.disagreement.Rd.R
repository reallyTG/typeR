library(stemmatology)


### Name: PCC.disagreement
### Title: PCC.disagreement: Find disagreements and agreements between
###   witnesses
### Aliases: PCC.disagreement
### Keywords: stemmatology

### ** Examples

#Load a tradition
data("fournival")
#Option: explore the tradition to see problems in variant locations
#PCC.Exploratory(fournival)
## Don't show: 
# subsetting for time gain
fournival = fournival[1:25,]
## End(Don't show)
#Calculate disagreements
PCC.disagreement(fournival)



