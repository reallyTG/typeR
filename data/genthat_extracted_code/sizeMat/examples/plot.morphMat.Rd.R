library(sizeMat)


### Name: plot.morphMat
### Title: Plot method for morphMat class (size at morphometric maturity)
### Aliases: plot.morphMat

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

my_mature = morph_mature(classify_data, method = "fq", niter = 50)

plot(my_mature, xlab = "Carapace width (mm.)", ylab = "Proportion mature", col = c("blue", "red"))



