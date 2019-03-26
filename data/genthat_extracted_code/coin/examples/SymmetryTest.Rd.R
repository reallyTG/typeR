library(coin)


### Name: SymmetryTest
### Title: General Symmetry Test
### Aliases: symmetry_test symmetry_test.formula symmetry_test.table
###   symmetry_test.SymmetryProblem
### Keywords: htest

### ** Examples

## One-sided exact Fisher-Pitman test for paired observations
y1 <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y2 <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)
dta <- data.frame(
    y = c(y1, y2),
    x = gl(2, length(y1)),
    block = factor(rep(seq_along(y1), 2))
)

symmetry_test(y ~ x | block, data = dta,
              distribution = "exact", alternative = "greater")

## Alternatively: transform data and set 'paired = TRUE'
delta <- y1 - y2
y <- as.vector(rbind(abs(delta) * (delta >= 0), abs(delta) * (delta < 0)))
x <- factor(rep(0:1, length(delta)), labels = c("pos", "neg"))
block <- gl(length(delta), 2)

symmetry_test(y ~ x | block,
              distribution = "exact", alternative = "greater",
              paired = TRUE)


### Example data
### Gerig (1969, p. 1597)
gerig <- data.frame(
    y1 = c( 0.547, 1.811, 2.561,
            1.706, 2.509, 1.414,
           -0.288, 2.524, 3.310,
            1.417, 0.703, 0.961,
            0.878, 0.094, 1.682,
           -0.680, 2.077, 3.181,
            0.056, 0.542, 2.983,
            0.711, 0.269, 1.662,
           -1.335, 1.545, 2.920,
            1.635, 0.200, 2.065),
    y2 = c(-0.575, 1.840, 2.399,
            1.252, 1.574, 3.059,
           -0.310, 1.553, 0.560,
            0.932, 1.390, 3.083,
            0.819, 0.045, 3.348,
            0.497, 1.747, 1.355,
           -0.285, 0.760, 2.332,
            0.089, 1.076, 0.960,
           -0.349, 1.471, 4.121,
            0.845, 1.480, 3.391),
    x = factor(rep(1:3, 10)),
    b = factor(rep(1:10, each = 3))
)

### Asymptotic multivariate Friedman test
### Gerig (1969, p. 1599)
symmetry_test(y1 + y2 ~ x | b, data = gerig, teststat = "quadratic",
              ytrafo = function(data)
                  trafo(data, numeric_trafo = rank_trafo,
                        block = gerig$b)) # L_n = 17.238

### Asymptotic multivariate Page test
(st <- symmetry_test(y1 + y2 ~ x | b, data = gerig,
                     ytrafo = function(data)
                         trafo(data, numeric_trafo = rank_trafo,
                               block = gerig$b),
                     scores = list(x = 1:3)))
pvalue(st, method = "step-down")



