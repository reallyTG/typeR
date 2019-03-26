library(fuzzySim)


### Name: multGLM
### Title: GLMs for multiple species with multiple options
### Aliases: multGLM
### Keywords: models regression multivariate

### ** Examples

data(rotif.env)

names(rotif.env)


# make models for 3 of the species in rotif.env:

mods <- multGLM(rotif.env, sp.cols = 45:47, var.cols = 5:17, id.col = 1,
step = TRUE, FDR = TRUE, trim = TRUE)

names(mods)

head(mods$predictions)

names(mods$models)

mods$models[[1]]

mods$models[["Ttetra"]]




