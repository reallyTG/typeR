library(fuzzySim)


### Name: fuzSim
### Title: Fuzzy similarity
### Aliases: fuzSim

### ** Examples

data(rotif.env)

names(rotif.env)


# you can calculate similarity between binary species occurrence patterns:

fuzSim(rotif.env[, "Abrigh"], rotif.env[, "Afissa"], method = "Jaccard")
fuzSim(rotif.env[, "Abrigh"], rotif.env[, "Afissa"], method = "Sorensen")
fuzSim(rotif.env[, "Abrigh"], rotif.env[, "Afissa"], method = "Simpson")
fuzSim(rotif.env[, "Abrigh"], rotif.env[, "Afissa"], method = "Baroni")


# or you can model environmental favourability for these species
# and calculate fuzzy similarity between their environmental predictions
# which goes beyond the strict coincidence of their occurrence records:

fav <- multGLM(rotif.env, sp.cols = 18:19, var.cols = 5:17, step = TRUE, 
FDR = TRUE, trim = TRUE, P = FALSE, Fav = TRUE) $ predictions

fuzSim(fav[, "Abrigh_F"], fav[, "Afissa_F"], method = "Jaccard")
fuzSim(fav[, "Abrigh_F"], fav[, "Afissa_F"], method = "Sorensen")
fuzSim(fav[, "Abrigh_F"], fav[, "Afissa_F"], method = "Simpson")
fuzSim(fav[, "Abrigh_F"], fav[, "Afissa_F"], method = "Baroni")



