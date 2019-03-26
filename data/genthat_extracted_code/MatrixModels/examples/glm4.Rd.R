library(MatrixModels)


### Name: glm4
### Title: Fitting Generalized Linear Models (using S4)
### Aliases: glm4
### Keywords: models regression

### ** Examples

### All the following is very experimental -- and probably will change: -------

data(CO2, package="datasets")
## dense linear model
str(glm4(uptake ~ 0 + Type*Treatment, data=CO2, doFit = FALSE), 4)
## sparse linear model
str(glm4(uptake ~ 0 + Type*Treatment, data=CO2, doFit = FALSE,
                  sparse = TRUE), 4)

## From example(glm): -----------------

## Dobson (1990) Page 93: Randomized Controlled Trial :
str(trial <- data.frame(counts=c(18,17,15,20,10,20,25,13,12),
                        outcome=gl(3,1,9,labels=LETTERS[1:3]),
                        treatment=gl(3,3,labels=letters[1:3])))
glm.D93 <- glm(counts ~ outcome + treatment, family=poisson, data=trial)
summary(glm.D93)
c.glm <- unname(coef(glm.D93))
glmM  <- glm4(counts ~ outcome + treatment, family = poisson, data=trial)
glmM2 <- update(glmM, quick = FALSE) # slightly more accurate
glmM3 <- update(glmM, quick = FALSE, finalUpdate = TRUE)
                 # finalUpdate has no effect on 'coef'
stopifnot( identical(glmM2@pred@coef, glmM3@pred@coef),
           all.equal(glmM @pred@coef, c.glm, tolerance=1e-7),
           all.equal(glmM2@pred@coef, c.glm, tolerance=1e-12))
## Don't show: 
All.eq <- function(x,y, ...) all.equal(x,y, tolerance= 1e-12, ...)
stopifnot( ## ensure typos are *caught* :
  inherits(try(glm4(counts ~ outcome + treatment, family=poisson, data=trial,
                       fooBar = FALSE)), "try-error"),
  ## check formula(.): {environments differ - FIXME?}
  formula(glmM) == formula(glm.D93),
  identical(coef(glmM2), coefficients(glmM3)),
  All.eq   (coef(glmM2), coefficients(glm.D93)),
  identical(fitted.values(glmM2), fitted(glmM3)),
  All.eq   (residuals(glmM2), resid(glm.D93), check.attributes=FALSE),# names()% FIXME ??
  identical(residuals(glmM2), resid(glmM3))
)
## End(Don't show)

## Watch the iterations --- and use no intercept --> more sparse X
## 1) dense generalized linear model
glmM <- glm4(counts ~ 0+outcome + treatment, poisson, trial,
                      verbose = TRUE)
## 2) sparse generalized linear model
glmS <- glm4(counts ~ 0+outcome + treatment, poisson, trial,
                      verbose = TRUE, sparse = TRUE)
str(glmS, max.lev = 4)
stopifnot( all.equal(glmM@pred@coef, glmS@pred@coef),
           all.equal(glmM@pred@Vtr,  glmS@pred@Vtr) )


## A Gamma example, from McCullagh & Nelder (1989, pp. 300-2)
clotting <- data.frame(u = c(5,10,15,20,30,40,60,80,100),
                       lot1 = c(118,58,42,35,27,25,21,19,18),
                       lot2 = c(69,35,26,21,18,16,13,12,12))
str(gMN <- glm4(lot1 ~ log(u), data=clotting, family=Gamma, verbose=TRUE))
glm. <- glm(lot1 ~ log(u), data=clotting, family=Gamma)
stopifnot( all.equal(gMN@pred@coef, unname(coef(glm.)), tolerance=1e-7) )



