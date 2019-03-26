library(enpls)


### Name: enspls.ad
### Title: Ensemble Sparse Partial Least Squares for Model Applicability
###   Domain Evaluation
### Aliases: enspls.ad

### ** Examples

data("logd1k")
# remove low variance variables
x = logd1k$x[, -c(17, 52, 59)]
y = logd1k$y

# training set
x.tr = x[1:300, ]
y.tr = y[1:300]

# two test sets
x.te = list(
  "test.1" = x[301:400, ],
  "test.2" = x[401:500, ])
y.te = list(
  "test.1" = y[301:400],
  "test.2" = y[401:500])

set.seed(42)
ad = enspls.ad(
  x.tr, y.tr, x.te, y.te,
  maxcomp = 3, alpha = c(0.3, 0.6, 0.9),
  space = "variable", method = "mc",
  ratio = 0.8, reptimes = 10)
print(ad)
plot(ad)
# the interactive plot requires a HTML viewer
## Not run: 
##D plot(ad, type = "interactive")
## End(Not run)



