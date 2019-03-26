library(coin)


### Name: mercuryfish
### Title: Chromosomal Effects of Mercury-Contaminated Fish Consumption
### Aliases: mercuryfish
### Keywords: datasets

### ** Examples

## Coherence criterion
coherence <- function(data) {
    x <- as.matrix(data)
    matrix(apply(x, 1, function(y)
        sum(colSums(t(x) < y) == ncol(x)) -
            sum(colSums(t(x) > y) == ncol(x))), ncol = 1)
}

## Asymptotic POSET test
poset <- independence_test(mercury + abnormal + ccells ~ group,
                           data = mercuryfish, ytrafo = coherence)

## Linear statistic (T in the notation of Rosenbaum, 1994)
statistic(poset, type = "linear")

## Expectation
expectation(poset)

## Variance
## Note: typo in Rosenbaum (1994, p. 371, Sec. 2, last paragraph)
variance(poset)

## Standardized statistic
statistic(poset)

## P-value
pvalue(poset)

## Exact POSET test
independence_test(mercury + abnormal + ccells ~ group,
                  data = mercuryfish, ytrafo = coherence,
                  distribution = "exact")

## Asymptotic multivariate test
mvtest <- independence_test(mercury + abnormal + ccells ~ group,
                            data = mercuryfish)

## Global p-value
pvalue(mvtest)

## Single-step adjusted p-values
pvalue(mvtest, method = "single-step")

## Step-down adjusted p-values
pvalue(mvtest, method = "step-down")



