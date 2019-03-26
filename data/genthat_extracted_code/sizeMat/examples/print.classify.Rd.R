library(sizeMat)


### Name: print.classify
### Title: Print method for classify class
### Aliases: print.classify

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

print(classify_data)



