library(ivmte)


### Name: genSSet
### Title: Generating LP moments for IV-like estimands
### Aliases: genSSet

### ** Examples

## Declare empty list to be updated (in the event multiple IV like
## specifications are provided)
sSet <- list()

## Declare MTR formulas
formula1 = ~ 1 + u
formula0 = ~ 1 + u

## Construct object that separates out non-spline components of MTR
## formulas from the spline components. The MTR functions are
## obtained from this object by the function 'genSSet'.
splinesList = list(removeSplines(formula0), removeSplines(formula1))

## Construct MTR polynomials
polynomials0 <- polyparse(formula = formula0,
                 data = dtm,
                 uname = u,
                 as.function = FALSE)

polynomials1 <- polyparse(formula = formula0,
                 data = dtm,
                 uname = u,
                 as.function = FALSE)

## Generate propensity score model
propensityObj <- propensity(formula = d ~ z,
                            data = dtm,
                            link = "linear")

## Generate IV estimates
ivEstimates <- ivEstimate(formula = ey ~ d | z,
                          data = dtm,
                          components = l(d),
                          treat = d,
                          list = FALSE)

## Construct S-set, which contains the coefficients and weights
## coresponding to various IV-like estimands
genSSet(data = dtm,
        sset = sSet,
        sest = ivEstimates,
        splinesobj = splinesList,
        pmodobj = propensityObj$phat,
        pm0 = polynomials0,
        pm1 = polynomials1,
        ncomponents = 1,
        scount = 1)




