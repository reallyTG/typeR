library(ivmte)


### Name: genTarget
### Title: Generating LP moments for IV-like estimands
### Aliases: genTarget

### ** Examples

## Declare MTR functions
formula1 = ~ 1 + u
formula0 = ~ 1 + u
splinesList = list(removeSplines(formula0), removeSplines(formula1))

## Declare propensity score model
propensityObj <- propensity(formula = d ~ z,
                            data = dtm,
                            link = "linear")

## Construct MTR polynomials
polynomials0 <- polyparse(formula = formula0,
                 data = dtm,
                 uname = u,
                 as.function = FALSE)

polynomials1 <- polyparse(formula = formula0,
                 data = dtm,
                 uname = u,
                 as.function = FALSE)

## Generate target gamma moments
genTarget(treat = "d",
          m0 = ~ 1 + u,
          m1 = ~ 1 + u,
          uname = u,
          target = "atu",
          data = dtm,
          splinesobj = splinesList,
          pmodobj = propensityObj,
          pm0 = polynomials0,
          pm1 = polynomials1,
          point = FALSE)





