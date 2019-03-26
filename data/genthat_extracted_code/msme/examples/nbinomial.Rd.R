library(msme)


### Name: nbinomial
### Title: A function to fit negative binomial generalized linear models
###   using maximum likelihood.
### Aliases: nbinomial
### Keywords: ~models

### ** Examples

data(medpar)

# TRADITIONAL NB REGRESSION WITH ALPHA

mynb1 <- nbinomial(los ~ hmo + white, data=medpar)
summary(mynb1)

# TRADITIONAL NB -- SHOWING ALL OPTIONS

mynb2 <- nbinomial(los ~ hmo + white,
                    formula2 = ~ 1,
                    data = medpar,
                    family = "nb2",
                    mean.link = "log",
                    scale.link = "inverse_s")
summary(mynb2)

# R GLM.NB - LIKE INVERTED DISPERSION BASED M

mynb3 <- nbinomial(los ~ hmo + white,
                    formula2 = ~ 1,
                    data = medpar,
                    family = "negBinomial",
                    mean.link = "log",
                    scale.link = "inverse_s")
summary(mynb3)

# R GLM.NB-TYPE INVERTED DISPERSON --THETA ; WITH DEFAULTS

mynb4 <- nbinomial(los ~ hmo + white, family="negBinomial", data =medpar)
summary(mynb4)

# HETEROGENEOUS NB; DISPERSION PARAMETERIZED

mynb5 <- nbinomial(los ~ hmo + white,
                    formula2 = ~ hmo + white,
                    data = medpar,
                    family = "negBinomial",
                    mean.link = "log",
                    scale.link = "log_s")
summary(mynb5)






