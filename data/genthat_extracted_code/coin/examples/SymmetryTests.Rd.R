library(coin)


### Name: SymmetryTests
### Title: Symmetry Tests
### Aliases: sign_test sign_test.formula sign_test.SymmetryProblem
###   wilcoxsign_test wilcoxsign_test.formula
###   wilcoxsign_test.SymmetryProblem friedman_test friedman_test.formula
###   friedman_test.SymmetryProblem quade_test quade_test.formula
###   quade_test.SymmetryProblem
### Keywords: htest

### ** Examples

## Example data from ?wilcox.test
y1 <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y2 <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

## One-sided exact sign test
(st <- sign_test(y1 ~ y2, distribution = "exact",
                 alternative = "greater"))
midpvalue(st) # mid-p-value

## One-sided exact Wilcoxon signed-rank test
(wt <- wilcoxsign_test(y1 ~ y2, distribution = "exact",
                       alternative = "greater"))
statistic(wt, type = "linear")
midpvalue(wt) # mid-p-value

## Comparison with R's wilcox.test() function
wilcox.test(y1, y2, paired = TRUE, alternative = "greater")


## Data with explicit group and block information
dta <- data.frame(y = c(y1, y2), x = gl(2, length(y1)),
                  block = factor(rep(seq_along(y1), 2)))

## For two samples, the sign test is equivalent to the Friedman test...
sign_test(y ~ x | block, data = dta, distribution = "exact")
friedman_test(y ~ x | block, data = dta, distribution = "exact")

## ...and the signed-rank test is equivalent to the Quade test
wilcoxsign_test(y ~ x | block, data = dta, distribution = "exact")
quade_test(y ~ x | block, data = dta, distribution = "exact")


## Comparison of three methods ("round out", "narrow angle", and "wide angle")
## for rounding first base.
## Hollander and Wolfe (1999, p. 274, Tab. 7.1)
rounding <- data.frame(
    times = c(5.40, 5.50, 5.55,
              5.85, 5.70, 5.75,
              5.20, 5.60, 5.50,
              5.55, 5.50, 5.40,
              5.90, 5.85, 5.70,
              5.45, 5.55, 5.60,
              5.40, 5.40, 5.35,
              5.45, 5.50, 5.35,
              5.25, 5.15, 5.00,
              5.85, 5.80, 5.70,
              5.25, 5.20, 5.10,
              5.65, 5.55, 5.45,
              5.60, 5.35, 5.45,
              5.05, 5.00, 4.95,
              5.50, 5.50, 5.40,
              5.45, 5.55, 5.50,
              5.55, 5.55, 5.35,
              5.45, 5.50, 5.55,
              5.50, 5.45, 5.25,
              5.65, 5.60, 5.40,
              5.70, 5.65, 5.55,
              6.30, 6.30, 6.25),
    methods = factor(rep(1:3, 22),
                     labels = c("Round Out", "Narrow Angle", "Wide Angle")),
    block = gl(22, 3)
)

## Asymptotic Friedman test
friedman_test(times ~ methods | block, data = rounding)

## Parallel coordinates plot
with(rounding, {
    matplot(t(matrix(times, ncol = 3, byrow = TRUE)),
            type = "l", lty = 1, col = 1, ylab = "Time", xlim = c(0.5, 3.5),
            axes = FALSE)
    axis(1, at = 1:3, labels = levels(methods))
    axis(2)
})

## Where do the differences come from?
## Wilcoxon-Nemenyi-McDonald-Thompson test (Hollander and Wolfe, 1999, p. 295)
## Note: all pairwise comparisons
(st <- symmetry_test(times ~ methods | block, data = rounding,
                     ytrafo = function(data)
                         trafo(data, numeric_trafo = rank_trafo,
                               block = rounding$block),
                     xtrafo = mcp_trafo(methods = "Tukey")))

## Simultaneous test of all pairwise comparisons
## Wide Angle vs. Round Out differ (Hollander and Wolfe, 1999, p. 296)
pvalue(st, method = "single-step") # subset pivotality is violated


## Strength Index of Cotton
## Hollander and Wolfe (1999, p. 286, Tab. 7.5)
cotton <- data.frame(
    strength = c(7.46, 7.17, 7.76, 8.14, 7.63,
                 7.68, 7.57, 7.73, 8.15, 8.00,
                 7.21, 7.80, 7.74, 7.87, 7.93),
    potash = ordered(rep(c(144, 108, 72, 54, 36), 3),
                     levels = c(144, 108, 72, 54, 36)),
    block = gl(3, 5)
)

## One-sided asymptotic Page test
friedman_test(strength ~ potash | block, data = cotton, alternative = "greater")

## One-sided approximative (Monte Carlo) Page test
friedman_test(strength ~ potash | block, data = cotton, alternative = "greater",
              distribution = approximate(B = 10000))


## Data from Quade (1979, p. 683)
dta <- data.frame(
    y = c(52, 45, 38,
          63, 79, 50,
          45, 57, 39,
          53, 51, 43,
          47, 50, 56,
          62, 72, 49,
          49, 52, 40),
     x = factor(rep(LETTERS[1:3], 7)),
     b = factor(rep(1:7, each = 3))
)

## Approximative (Monte Carlo) Friedman test
## Quade (1979, p. 683)
friedman_test(y ~ x | b, data = dta,
              distribution = approximate(B = 10000)) # chi^2 = 6.000

## Approximative (Monte Carlo) Quade test
## Quade (1979, p. 683)
(qt <- quade_test(y ~ x | b, data = dta,
                  distribution = approximate(B = 10000))) # W = 8.157

## Comparison with R's quade.test() function
quade.test(y ~ x | b, data = dta)

## quade.test() uses an F-statistic
b <- nlevels(qt@statistic@block)
A <- sum(qt@statistic@y^2)
B <- sum(statistic(qt, type = "linear")^2) / b
(b - 1) * B / (A - B) # F = 8.3765



