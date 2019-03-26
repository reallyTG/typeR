library(coin)


### Name: ContingencyTests
### Title: Tests of Independence in Two- or Three-Way Contingency Tables
### Aliases: chisq_test chisq_test.formula chisq_test.table
###   chisq_test.IndependenceProblem cmh_test cmh_test.formula
###   cmh_test.table cmh_test.IndependenceProblem lbl_test lbl_test.formula
###   lbl_test.table lbl_test.IndependenceProblem
### Keywords: htest

### ** Examples

## Example data
## Davis (1986, p. 140)
davis <- matrix(
    c(3,  6,
      2, 19),
    nrow = 2, byrow = TRUE
)
davis <- as.table(davis)

## Asymptotic Pearson chi-squared test
chisq_test(davis)

## Approximative (Monte Carlo) Pearson chi-squared test
ct <- chisq_test(davis,
                 distribution = approximate(B = 10000))
pvalue(ct)          # standard p-value
midpvalue(ct)       # mid-p-value
pvalue_interval(ct) # p-value interval

## Exact Pearson chi-squared test (Davis, 1986)
## Note: disagrees with Fisher's exact test
ct <- chisq_test(davis,
                 distribution = "exact")
pvalue(ct)          # standard p-value
midpvalue(ct)       # mid-p-value
pvalue_interval(ct) # p-value interval
fisher.test(davis)


## Laryngeal cancer data
## Agresti (2002, p. 107, Tab. 3.13)
cancer <- matrix(
    c(21, 2,
      15, 3),
    nrow = 2, byrow = TRUE,
    dimnames = list(
        "Treatment" = c("Surgery", "Radiation"),
           "Cancer" = c("Controlled", "Not Controlled")
    )
)
cancer <- as.table(cancer)

## Exact Pearson chi-squared test (Agresti, 2002, p. 108, Tab. 3.14)
## Note: agrees with Fishers's exact test
(ct <- chisq_test(cancer,
                  distribution = "exact"))
midpvalue(ct)       # mid-p-value
pvalue_interval(ct) # p-value interval
fisher.test(cancer)


## Homework conditions and teacher's rating
## Yates (1948, Tab. 1)
yates <- matrix(
    c(141, 67, 114, 79, 39,
      131, 66, 143, 72, 35,
       36, 14,  38, 28, 16),
    byrow = TRUE, ncol = 5,
    dimnames = list(
           "Rating" = c("A", "B", "C"),
        "Condition" = c("A", "B", "C", "D", "E")
    )
)
yates <- as.table(yates)

## Asymptotic Pearson chi-squared test (Yates, 1948, p. 176)
chisq_test(yates)

## Asymptotic Pearson-Yates chi-squared test (Yates, 1948, pp. 180-181)
## Note: 'Rating' and 'Condition' as ordinal
(ct <- chisq_test(yates,
                  alternative = "less",
                  scores = list("Rating" = c(-1, 0, 1),
                                "Condition" = c(2, 1, 0, -1, -2))))
statistic(ct)^2 # chi^2 = 2.332

## Asymptotic Pearson-Yates chi-squared test (Yates, 1948, p. 181)
## Note: 'Rating' as ordinal
chisq_test(yates,
           scores = list("Rating" = c(-1, 0, 1))) # Q = 3.825


## Change in clinical condition and degree of infiltration
## Cochran (1954, Tab. 6)
cochran <- matrix(
    c(11,  7,
      27, 15,
      42, 16,
      53, 13,
      11,  1),
    byrow = TRUE, ncol = 2,
    dimnames = list(
              "Change" = c("Marked", "Moderate", "Slight",
                           "Stationary", "Worse"),
        "Infiltration" = c("0-7", "8-15")
    )
)
cochran <- as.table(cochran)

## Asymptotic Pearson chi-squared test (Cochran, 1954, p. 435)
chisq_test(cochran) # X^2 = 6.88

## Asymptotic Cochran-Armitage test (Cochran, 1954, p. 436)
## Note: 'Change' as ordinal
(ct <- chisq_test(cochran,
                  scores = list("Change" = c(3, 2, 1, 0, -1))))
statistic(ct)^2 # X^2 = 6.66


## Change in size of ulcer crater for two treatment groups
## Armitage (1955, Tab. 2)
armitage <- matrix(
    c( 6, 4, 10, 12,
      11, 8,  8,  5),
    byrow = TRUE, ncol = 4,
    dimnames = list(
        "Treatment" = c("A", "B"),
           "Crater" = c("Larger", "< 2/3 healed",
                        "=> 2/3 healed", "Healed")
    )
)
armitage <- as.table(armitage)

## Approximative (Monte Carlo) Pearson chi-squared test (Armitage, 1955, p. 379)
chisq_test(armitage,
           distribution = approximate(B = 10000)) # chi^2 = 5.91

## Approximative (Monte Carlo) Cochran-Armitage test (Armitage, 1955, p. 379)
(ct <- chisq_test(armitage,
                  distribution = approximate(B = 10000),
                  scores = list("Crater" = c(-1.5, -0.5, 0.5, 1.5))))
statistic(ct)^2 # chi_0^2 = 5.26


## Relationship between job satisfaction and income stratified by gender
## Agresti (2002, p. 288, Tab. 7.8)

## Asymptotic generalized Cochran-Mantel-Haenszel test (Agresti, p. 297)
cmh_test(jobsatisfaction) # CMH = 10.2001

## Asymptotic generalized Cochran-Mantel-Haenszel test (Agresti, p. 297)
## Note: 'Job.Satisfaction' as ordinal
cmh_test(jobsatisfaction,
         scores = list("Job.Satisfaction" = c(1, 3, 4, 5))) # L^2 = 9.0342

## Asymptotic linear-by-linear association test (Agresti, p. 297)
## Note: 'Job.Satisfaction' and 'Income' as ordinal
(lt <- lbl_test(jobsatisfaction,
                scores = list("Job.Satisfaction" = c(1, 3, 4, 5),
                              "Income" = c(3, 10, 20, 35))))
statistic(lt)^2 # M^2 = 6.1563



