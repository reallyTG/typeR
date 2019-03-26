library(msme)


### Name: ufc
### Title: Upper Flat Creek forest cruise tree data
### Aliases: ufc
### Keywords: datasets

### ** Examples

data(ufc)

ufc <- na.omit(ufc)
ml.g <- ml_glm2(height.m ~ dbh.cm,
                formula2 = ~1,
                data = ufc,
                family = "normal",
                mean.link = "identity",
                scale.link = "log_s")

lm.g <- lm(height.m ~ dbh.cm,
                data = ufc)
                
ml.g
lm.g

summary(ml.g)
summary(lm.g)





