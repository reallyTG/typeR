library(MuMIn)


### Name: dredge
### Title: Automated model selection
### Aliases: dredge dc V print.model.selection
### Keywords: models

### ** Examples

# Example from Burnham and Anderson (2002), page 100:

#  prevent fitting sub-models to different datasets
## Don't show: 
oop <- 
## End(Don't show)
options(na.action = "na.fail")

fm1 <- lm(y ~ ., data = Cement)
dd <- dredge(fm1)
subset(dd, delta < 4)

# Visualize the model selection table:
## Don't show: 
 if(require(graphics)) { 
## End(Don't show)
par(mar = c(3,5,6,4))
plot(dd, labAsExpr = TRUE)
## Don't show: 
 } 
## End(Don't show)

# Model average models with delta AICc < 4
model.avg(dd, subset = delta < 4)

#or as a 95% confidence set:
model.avg(dd, subset = cumsum(weight) <= .95) # get averaged coefficients

#'Best' model
summary(get.models(dd, 1)[[1]])

## Not run: 
##D # Examples of using 'subset':
##D # keep only models containing X3
##D dredge(fm1, subset = ~ X3) # subset as a formula
##D dredge(fm1, subset = expression(X3)) # subset as expression object
##D # the same, but more effective:
##D dredge(fm1, fixed = "X3")
##D # exclude models containing both X1 and X2 at the same time
##D dredge(fm1, subset = !(X1 && X2))
##D # Fit only models containing either X3 or X4 (but not both);
##D # include X3 only if X2 is present, and X2 only if X1 is present.
##D dredge(fm1, subset = dc(X1, X2, X3) && xor(X3, X4))
##D # the same as above, without "dc"
##D dredge(fm1, subset = (X1 | !X2) && (X2 | !X3) && xor(X3, X4))
##D 
##D # Include only models with up to 2 terms (and intercept)
##D dredge(fm1, m.lim = c(0, 2))
## End(Not run)

# Add R^2 and F-statistics, use the 'extra' argument
dredge(fm1, m.lim = c(NA, 1), extra = c("R^2", F = function(x)
    summary(x)$fstatistic[[1]]))

# with summary statistics:
dredge(fm1, m.lim = c(NA, 1), extra = list(
    "R^2", "*" = function(x) {
        s <- summary(x)
        c(Rsq = s$r.squared, adjRsq = s$adj.r.squared,
            F = s$fstatistic[[1]])
    })
)

# Add other information criterions (but rank with AICc):
dredge(fm1, m.lim = c(NA, 1), extra = alist(AIC, BIC, ICOMP, Cp))
## Don't show: 
options(oop)
## End(Don't show)



