library(sandwich)


### Name: vcovCL
### Title: Clustered Covariance Matrix Estimation
### Aliases: vcovCL meatCL
### Keywords: regression

### ** Examples

## Petersen's data
data("PetersenCL", package = "sandwich")
m <- lm(y ~ x, data = PetersenCL)

## clustered covariances
## one-way
vcovCL(m, cluster = ~ firm)
vcovCL(m, cluster = PetersenCL$firm) ## same
## one-way with HC2
vcovCL(m, cluster = ~ firm, type = "HC2")
## two-way
vcovCL(m, cluster = ~ firm + year)
vcovCL(m, cluster = PetersenCL[, c("firm", "year")]) ## same

## comparison with cross-section sandwiches
## HC0
all.equal(sandwich(m), vcovCL(m, type = "HC0", cadjust = FALSE))
## HC2
all.equal(vcovHC(m, type = "HC2"), vcovCL(m, type = "HC2"))
## HC3
all.equal(vcovHC(m, type = "HC3"), vcovCL(m, type = "HC3"))

## Innovation data
data("InstInnovation", package = "sandwich")

## replication of one-way clustered standard errors for model 3, Table I
## and model 1, Table II in Berger et al. (2016)

## count regression formula
f1 <- cites ~ institutions + log(capital/employment) + log(sales) + industry + year

## model 3, Table I: Poisson model
## one-way clustered standard errors
tab_I_3_pois <- glm(f1, data = InstInnovation, family = poisson)
vcov_pois <- vcovCL(tab_I_3_pois, InstInnovation$company)
sqrt(diag(vcov_pois))[2:4]

## coefficient tables
if(require("lmtest")) {
coeftest(tab_I_3_pois, vcov = vcov_pois)[2:4, ]
}

## Not run: 
##D ## model 1, Table II: negative binomial hurdle model
##D ## (requires "pscl" or alternatively "countreg" from R-Forge)
##D library("pscl")
##D library("lmtest")
##D tab_II_3_hurdle <- hurdle(f1, data = InstInnovation, dist = "negbin")
##D #  dist = "negbin", zero.dist = "negbin", separate = FALSE)
##D vcov_hurdle <- vcovCL(tab_II_3_hurdle, InstInnovation$company)
##D sqrt(diag(vcov_hurdle))[c(2:4, 149:151)]
##D coeftest(tab_II_3_hurdle, vcov = vcov_hurdle)[c(2:4, 149:151), ]
## End(Not run)



