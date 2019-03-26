library(drc)


### Name: terbuthylazin
### Title: The effect of terbuthylazin on growth rate
### Aliases: terbuthylazin
### Keywords: datasets

### ** Examples


## displaying first 6 rows of the data set
head(terbuthylazin)

## Fitting log-logistic model
terbuthylazin.m1 <- drm(rgr~dose, data = terbuthylazin, fct = LL.4())
summary(terbuthylazin.m1)

## Fitting log-logistic model
##  with Box-Cox transformation
terbuthylazin.m2 <- boxcox(terbuthylazin.m1, method = "anova")
summary(terbuthylazin.m2)




