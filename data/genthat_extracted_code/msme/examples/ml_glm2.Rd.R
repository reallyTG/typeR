library(msme)


### Name: ml_glm2
### Title: A function to fit generalized linear models using maximum
###   likelihood.
### Aliases: ml_glm2
### Keywords: ~models

### ** Examples

data(medpar)
ml.nb2 <- ml_glm2(los ~ hmo + white,
                    formula2 = ~1,
                    data = medpar,
                    family = "negBinomial",
                    mean.link = "log",
                    scale.link = "inverse_s")

data(ufc)

ufc <- na.omit(ufc)
ml.g <- ml_glm2(height.m ~ dbh.cm,
                formula2 = ~ dbh.cm,
                data = ufc,
                family = "normal",
                mean.link = "identity",
                scale.link = "log_s")

summary(ml.g)




