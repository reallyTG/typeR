library(sizeMat)


### Name: print.morphMat
### Title: Print method for morphMat class (size at morphometric maturity)
### Aliases: print.morphMat

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

my_mature = morph_mature(classify_data, method = "fq", niter = 50)

print(my_mature)



