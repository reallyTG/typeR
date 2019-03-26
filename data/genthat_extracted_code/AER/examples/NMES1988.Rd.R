library(AER)


### Name: NMES1988
### Title: Demand for Medical Care in NMES 1988
### Aliases: NMES1988
### Keywords: datasets

### ** Examples

## packages
library("MASS")
library("pscl")

## select variables for analysis
data("NMES1988")
nmes <- NMES1988[, c(1, 7:8, 13, 15, 18)]

## dependent variable
hist(nmes$visits, breaks = 0:(max(nmes$visits)+1) - 0.5)
plot(table(nmes$visits))

## convenience transformations for exploratory graphics
clog <- function(x) log(x + 0.5)
cfac <- function(x, breaks = NULL) {
  if(is.null(breaks)) breaks <- unique(quantile(x, 0:10/10))
  x <- cut(x, breaks, include.lowest = TRUE, right = FALSE)
  levels(x) <- paste(breaks[-length(breaks)], ifelse(diff(breaks) > 1,
    c(paste("-", breaks[-c(1, length(breaks))] - 1, sep = ""), "+"), ""), sep = "")
  return(x)
}

## bivariate visualization
par(mfrow = c(3, 2))
plot(clog(visits) ~ health, data = nmes, varwidth = TRUE)
plot(clog(visits) ~ cfac(chronic), data = nmes)
plot(clog(visits) ~ insurance, data = nmes, varwidth = TRUE)
plot(clog(visits) ~ gender, data = nmes, varwidth = TRUE)
plot(cfac(visits, c(0:2, 4, 6, 10, 100)) ~ school, data = nmes, breaks = 9)
par(mfrow = c(1, 1))

## Poisson regression
nmes_pois <- glm(visits ~ ., data = nmes, family = poisson)
summary(nmes_pois)

## LM test for overdispersion
dispersiontest(nmes_pois)
dispersiontest(nmes_pois, trafo = 2)

## sandwich covariance matrix
coeftest(nmes_pois, vcov = sandwich)

## quasipoisson model
nmes_qpois <- glm(visits ~ ., data = nmes, family = quasipoisson)

## NegBin regression
nmes_nb <- glm.nb(visits ~ ., data = nmes)

## hurdle regression
nmes_hurdle <- hurdle(visits ~ . | chronic + insurance + school + gender,
  data = nmes, dist = "negbin")

## zero-inflated regression model
nmes_zinb <- zeroinfl(visits ~ . | chronic + insurance + school + gender,
  data = nmes, dist = "negbin")

## compare estimated coefficients
fm <- list("ML-Pois" = nmes_pois, "Quasi-Pois" = nmes_qpois, "NB" = nmes_nb,
  "Hurdle-NB" = nmes_hurdle, "ZINB" = nmes_zinb)
round(sapply(fm, function(x) coef(x)[1:7]), digits = 3)

## associated standard errors
round(cbind("ML-Pois" = sqrt(diag(vcov(nmes_pois))),
  "Adj-Pois" = sqrt(diag(sandwich(nmes_pois))),
  sapply(fm[-1], function(x) sqrt(diag(vcov(x)))[1:7])),
  digits = 3)

## log-likelihoods and number of estimated parameters
rbind(logLik = sapply(fm, function(x) round(logLik(x), digits = 0)),
  Df = sapply(fm, function(x) attr(logLik(x), "df")))

## predicted number of zeros
round(c("Obs" = sum(nmes$visits < 1),
  "ML-Pois" = sum(dpois(0, fitted(nmes_pois))),
  "Adj-Pois" = NA,
  "Quasi-Pois" = NA,
  "NB" = sum(dnbinom(0, mu = fitted(nmes_nb), size = nmes_nb$theta)),
  "NB-Hurdle" = sum(predict(nmes_hurdle, type = "prob")[,1]),
  "ZINB" = sum(predict(nmes_zinb, type = "prob")[,1])))

## coefficients of zero-augmentation models
t(sapply(fm[4:5], function(x) round(x$coefficients$zero, digits = 3)))



