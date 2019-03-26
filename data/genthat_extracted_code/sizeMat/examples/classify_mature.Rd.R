library(sizeMat)


### Name: classify_mature
### Title: Classify mature
### Aliases: classify_mature

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

classify_data



