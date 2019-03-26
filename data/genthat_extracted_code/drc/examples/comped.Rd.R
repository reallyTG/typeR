library(drc)


### Name: comped
### Title: Comparison of effective dose values
### Aliases: comped
### Keywords: models nonlinear

### ** Examples


## Fitting the model
S.alba.m1 <- boxcox(drm(DryMatter~Dose, Herbicide, data=S.alba, fct = LL.4(),
pmodels=data.frame(Herbicide,1,1,Herbicide)), method = "anova") 

## Displaying estimated ED values
ED(S.alba.m1, c(10, 90))

## Making comparisons of ED50 in two ways and for both differences and ratios
compParm(S.alba.m1, "e", "/")

comped(c(28.396147, 65.573335), c(1.874598, 5.618945), log=FALSE, operator = "/")
# similar result

compParm(S.alba.m1, "e", "-")

comped(c(28.396147, 65.573335), c(1.874598, 5.618945), log=FALSE, operator = "-")
# similar result

## Making comparisons of ED10 and ED90
comped(c(21.173, 44.718), c(11.87, 8.42), log=FALSE, operator = "/")

comped(c(21.173, 44.718), c(11.87, 8.42), log=FALSE, operator = "/", interval = FALSE)

comped(c(21.173, 44.718), c(11.87, 8.42), log=FALSE, operator = "-")




