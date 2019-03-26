library(sizeMat)


### Name: morph_mature
### Title: Estimate morphometric mature
### Aliases: morph_mature

### ** Examples

data(crabdata)

classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"),
varSex = "sex_category", selectSex = NULL, method = "ld")

my_mature = morph_mature(classify_data, method = "fq", niter = 50)

# 'niter' parameters:
my_mature$A_boot
my_mature$B_boot
my_mature$L50_boot
my_mature$out



