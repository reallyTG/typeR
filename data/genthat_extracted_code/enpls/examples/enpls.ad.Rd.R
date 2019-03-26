library(enpls)


### Name: enpls.ad
### Title: Ensemble Partial Least Squares for Model Applicability Domain
###   Evaluation
### Aliases: enpls.ad

### ** Examples

data("alkanes")
x = alkanes$x
y = alkanes$y

# training set
x.tr = x[1:100, ]
y.tr = y[1:100]

# two test sets
x.te = list(
  "test.1" = x[101:150, ],
  "test.2" = x[151:207, ])
y.te = list(
  "test.1" = y[101:150],
  "test.2" = y[151:207])

set.seed(42)
ad = enpls.ad(
  x.tr, y.tr, x.te, y.te,
  space = "variable", method = "mc",
  ratio = 0.9, reptimes = 50)
print(ad)
plot(ad)
# the interactive plot requires a HTML viewer
## Not run: 
##D plot(ad, type = "interactive")
## End(Not run)



