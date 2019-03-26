library(crch)


### Name: hxlr
### Title: Heteroscedastic Extended Logistic Regression
### Aliases: hxlr
### Keywords: regression

### ** Examples

data("RainIbk")
## mean and standard deviation of square root transformed ensemble forecasts
RainIbk$sqrtensmean <- 
  apply(sqrt(RainIbk[,grep('^rainfc',names(RainIbk))]), 1, mean)
RainIbk$sqrtenssd <- 
  apply(sqrt(RainIbk[,grep('^rainfc',names(RainIbk))]), 1, sd)

## climatological deciles
q <- unique(quantile(RainIbk$rain, seq(0.1, 0.9, 0.1)))

## fit ordinary extended logistic regression with ensemble mean as 
## predictor variable
XLR <- hxlr(sqrt(rain) ~ sqrtensmean, data = RainIbk, thresholds = sqrt(q))
## print
XLR
## summary
summary(XLR)


## fit ordinary extended logistic regression with ensemble mean 
## and standard deviation as predictor variables
XLRS <- hxlr(sqrt(rain) ~ sqrtensmean + sqrtenssd, data = RainIbk, 
  thresholds = sqrt(q))
## fit heteroscedastic extended logistic regression with ensemble 
## standard deviation as predictor for the scale
HXLR <- hxlr(sqrt(rain) ~ sqrtensmean | sqrtenssd, data = RainIbk, 
  thresholds = sqrt(q))

## compare AIC of different models
AIC(XLR, XLRS, HXLR)

## XLRS and HXLR are nested in XLR -> likelihood-ratio-tests
if(require("lmtest")) {
  lrtest(XLR, XLRS)
  lrtest(XLR, HXLR)
}

## Not run: 
##D ###################################################################
##D ## Cross-validation and bootstrapping RPS for different models 
##D ## (like in Messner 2013). 
##D N <- NROW(RainIbk)
##D ## function that returns model fits
##D fits <- function(data, weights = rep(1, N)) {
##D   list(
##D     "XLR"    = hxlr(sqrt(rain) ~ sqrtensmean, data = data, 
##D       weights = weights, thresholds = sqrt(q)),
##D     "XLR:S"  = hxlr(sqrt(rain) ~ sqrtensmean + sqrtenssd, data = data, 
##D       weights = weights, thresholds = sqrt(q)),
##D     "XLR:SM" = hxlr(sqrt(rain) ~ sqrtensmean + I(sqrtensmean*sqrtenssd), 
##D       data = data, weights = weights, thresholds = sqrt(q)),
##D     "HXLR"   = hxlr(sqrt(rain) ~ sqrtensmean | sqrtenssd, data = data, 
##D       weights = weights, thresholds = sqrt(q)),
##D     "HXLR:S" = hxlr(sqrt(rain) ~ sqrtensmean + sqrtenssd | sqrtenssd, 
##D       data = data, weights = weights, thresholds = sqrt(q))
##D   )
##D }
##D 
##D 
##D ## cross validation
##D id <- sample(1:10, N, replace = TRUE)
##D obs <- NULL
##D pred <- list(NULL)
##D for(i in 1:10) {
##D   ## splitting into test and training data set
##D   trainIndex <- which(id != i)     
##D   testIndex <- which(id == i)			     
##D   ## weights that are used for fitting the models
##D   weights <- as.numeric(table(factor(trainIndex, levels = c(1:N))))
##D   ## testdata
##D   testdata <- RainIbk[testIndex,]
##D   ## observations    
##D   obs <- c(obs, RainIbk$rain[testIndex])
##D   ## estimation
##D   modelfits <- fits(RainIbk, weights)
##D   ## Prediction
##D   pred2 <- lapply(modelfits, predict, newdata = testdata, type = "cumprob")
##D   pred <- mapply(rbind, pred, pred2, SIMPLIFY = FALSE)
##D }
##D names(pred) <- c(names(modelfits))
##D 
##D ## function to compute RPS
##D rps <- function(pred, obs) {
##D   OBS <- NULL
##D   for(i in 1:N) 
##D     OBS <- rbind(OBS, rep(0:1, c(obs[i] - 1, length(q) - obs[i] + 1)))
##D   apply((OBS-pred)^2, 1, sum)
##D }
##D 
##D ## compute rps
##D RPS <- lapply(pred, rps, obs = as.numeric(cut(obs, c(-Inf, q, Inf))))
##D 
##D ## bootstrapping mean rps 
##D rpsall <- NULL
##D for(i in 1:250) {
##D   index <- sample(length(obs), replace = TRUE)
##D   rpsall <- rbind(rpsall, sapply(RPS, function(x) mean(x[index])))
##D }
##D   
##D rpssall <- 1 - rpsall/rpsall[,1]
##D boxplot(rpssall[,-1], ylab = "RPSS", main = "RPSS relative to XLR")
##D abline(h = 0, lty = 2)
## End(Not run)



