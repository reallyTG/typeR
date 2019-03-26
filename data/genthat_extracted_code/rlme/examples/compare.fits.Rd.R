library(rlme)


### Name: compare.fits
### Title: Compare Fits
### Aliases: compare.fits
### Keywords: models

### ** Examples



data(schools)
model = y ~ 1 + sex + age + (1 | region) + (1 | region:school)

# Extract covariants into matrix
cov = as.matrix(data.frame(schools[,"sex"], schools[,"age"]))

# Fit the models using each method
reml.fit = rlme(model, schools, method="reml")
gr.fit = rlme(model, schools, method="gr")

compare.fits(cov, reml.fit, gr.fit)




