library(coin)


### Name: LocationTests
### Title: Two- and K-Sample Location Tests
### Aliases: oneway_test oneway_test.formula
###   oneway_test.IndependenceProblem wilcox_test wilcox_test.formula
###   wilcox_test.IndependenceProblem kruskal_test kruskal_test.formula
###   kruskal_test.IndependenceProblem normal_test normal_test.formula
###   normal_test.IndependenceProblem median_test median_test.formula
###   median_test.IndependenceProblem savage_test savage_test.formula
###   savage_test.IndependenceProblem
### Keywords: htest

### ** Examples
## Don't show: 
options(useFancyQuotes = FALSE)
## End(Don't show)
## Tritiated Water Diffusion Across Human Chorioamnion
## Hollander and Wolfe (1999, p. 110, Tab. 4.1)
diffusion <- data.frame(
    pd = c(0.80, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46,
           1.15, 0.88, 0.90, 0.74, 1.21),
    age = factor(rep(c("At term", "12-26 Weeks"), c(10, 5)))
)

## Exact Wilcoxon-Mann-Whitney test
## Hollander and Wolfe (1999, p. 111)
## (At term - 12-26 Weeks)
(wt <- wilcox_test(pd ~ age, data = diffusion,
                   distribution = "exact", conf.int = TRUE))

## Extract observed Wilcoxon statistic
## Note: this is the sum of the ranks for age = "12-26 Weeks"
statistic(wt, type = "linear")

## Expectation, variance, two-sided pvalue and confidence interval
expectation(wt)
covariance(wt)
pvalue(wt)
confint(wt)

## For two samples, the Kruskal-Wallis test is equivalent to the W-M-W test
kruskal_test(pd ~ age, data = diffusion,
             distribution = "exact")

## Asymptotic Fisher-Pitman test
oneway_test(pd ~ age, data = diffusion)

## Approximative (Monte Carlo) Fisher-Pitman test
pvalue(oneway_test(pd ~ age, data = diffusion,
                   distribution = approximate(B = 10000)))

## Exact Fisher-Pitman test
pvalue(ot <- oneway_test(pd ~ age, data = diffusion,
                         distribution = "exact"))

## Plot density and distribution of the standardized test statistic
op <- par(no.readonly = TRUE) # save current settings
layout(matrix(1:2, nrow = 2))
s <- support(ot)
d <- dperm(ot, s)
p <- pperm(ot, s)
plot(s, d, type = "S", xlab = "Test Statistic", ylab = "Density")
plot(s, p, type = "S", xlab = "Test Statistic", ylab = "Cum. Probability")
par(op) # reset


## Example data
ex <- data.frame(
    y = c(3, 4, 8, 9, 1, 2, 5, 6, 7),
    x = factor(rep(c("no", "yes"), c(4, 5)))
)

## Boxplots
boxplot(y ~ x, data = ex)

## Exact Brown-Mood median test with different mid-scores
(mt1 <- median_test(y ~ x, data = ex, distribution = "exact"))
(mt2 <- median_test(y ~ x, data = ex, distribution = "exact",
                    mid.score = "0.5"))
(mt3 <- median_test(y ~ x, data = ex, distribution = "exact",
                    mid.score = "1")) # sign change!

## Plot density and distribution of the standardized test statistics
op <- par(no.readonly = TRUE) # save current settings
layout(matrix(1:3, nrow = 3))
s1 <- support(mt1); d1 <- dperm(mt1, s1)
plot(s1, d1, type = "h", main = "Mid-score: 0",
     xlab = "Test Statistic", ylab = "Density")
s2 <- support(mt2); d2 <- dperm(mt2, s2)
plot(s2, d2, type = "h", main = "Mid-score: 0.5",
     xlab = "Test Statistic", ylab = "Density")
s3 <- support(mt3); d3 <- dperm(mt3, s3)
plot(s3, d3, type = "h", main = "Mid-score: 1",
     xlab = "Test Statistic", ylab = "Density")
par(op) # reset


## Length of YOY Gizzard Shad
## Hollander and Wolfe (1999, p. 200, Tab. 6.3)
yoy <- data.frame(
    length = c(46, 28, 46, 37, 32, 41, 42, 45, 38, 44,
               42, 60, 32, 42, 45, 58, 27, 51, 42, 52,
               38, 33, 26, 25, 28, 28, 26, 27, 27, 27,
               31, 30, 27, 29, 30, 25, 25, 24, 27, 30),
    site = gl(4, 10, labels = as.roman(1:4))
)

## Approximative (Monte Carlo) Kruskal-Wallis test
kruskal_test(length ~ site, data = yoy,
             distribution = approximate(B = 10000))

## Approximative (Monte Carlo) Nemenyi-Damico-Wolfe-Dunn test (joint ranking)
## Hollander and Wolfe (1999, p. 244)
## (where Steel-Dwass results are given)
it <- independence_test(length ~ site, data = yoy,
                        distribution = approximate(B = 50000),
                        ytrafo = function(data)
                            trafo(data, numeric_trafo = rank_trafo),
                        xtrafo = mcp_trafo(site = "Tukey"))

## Global p-value
pvalue(it)

## Sites (I = II) != (III = IV) at alpha = 0.01 (p. 244)
pvalue(it, method = "single-step") # subset pivotality is violated



