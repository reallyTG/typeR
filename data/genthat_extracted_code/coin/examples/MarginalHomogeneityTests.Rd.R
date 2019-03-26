library(coin)


### Name: MarginalHomogeneityTests
### Title: Marginal Homogeneity Tests
### Aliases: mh_test mh_test.formula mh_test.table mh_test.SymmetryProblem
### Keywords: htest

### ** Examples

## Performance of prime minister
## Agresti (2002, p. 409)
performance <- matrix(
    c(794, 150,
       86, 570),
    nrow = 2, byrow = TRUE,
    dimnames = list(
         "First" = c("Approve", "Disprove"),
        "Second" = c("Approve", "Disprove")
    )
)
performance <- as.table(performance)
diag(performance) <- 0 # speed-up: only off-diagonal elements contribute

## Asymptotic McNemar Test
mh_test(performance)

## Exact McNemar Test
mh_test(performance, distribution = "exact")


## Effectiveness of different media for the growth of diphtheria
## Cochran (1950, Tab. 2)
cases <- c(4, 2, 3, 1, 59)
n <- sum(cases)
cochran <- data.frame(
    diphtheria = factor(
        unlist(rep(list(c(1, 1, 1, 1),
                        c(1, 1, 0, 1),
                        c(0, 1, 1, 1),
                        c(0, 1, 0, 1),
                        c(0, 0, 0, 0)),
                   cases))
    ),
    media = factor(rep(LETTERS[1:4], n)),
    case =  factor(rep(seq_len(n), each = 4))
)

## Asymptotic Cochran Q test (Cochran, 1950, p. 260)
mh_test(diphtheria ~ media | case, data = cochran) # Q = 8.05

## Approximative Cochran Q test
mt <- mh_test(diphtheria ~ media | case, data = cochran,
              distribution = approximate(B = 10000))
pvalue(mt)          # standard p-value
midpvalue(mt)       # mid-p-value
pvalue_interval(mt) # p-value interval


## Opinions on Pre- and Extramarital Sex
## Agresti (2002, p. 421)
opinions <- c("Always wrong", "Almost always wrong",
              "Wrong only sometimes", "Not wrong at all")
PreExSex <- matrix(
    c(144, 33, 84, 126,
        2,  4, 14,  29,
        0,  2,  6,  25,
        0,  0,  1,   5),
    nrow = 4,
    dimnames = list(
          "Premarital Sex" = opinions,
        "Extramarital Sex" = opinions
    )
)
PreExSex <- as.table(PreExSex)

## Asymptotic Stuart test
mh_test(PreExSex)

## Asymptotic Stuart-Birch test
## Note: response as ordinal
mh_test(PreExSex, scores = list(response = 1:length(opinions)))


## Vote intention
## Madansky (1963, pp. 107-108)
vote <- array(
    c(120, 1,  8, 2,   2,  1, 2, 1,  7,
        6, 2,  1, 1, 103,  5, 1, 4,  8,
       20, 3, 31, 1,   6, 30, 2, 1, 81),
    dim = c(3, 3, 3),
    dimnames = list(
          "July" = c("Republican", "Democratic", "Uncertain"),
        "August" = c("Republican", "Democratic", "Uncertain"),
          "June" = c("Republican", "Democratic", "Uncertain")
    )
)
vote <- as.table(vote)

## Asymptotic Madansky test (Q = 70.77)
mh_test(vote)


## Cross-over study
## http://www.nesug.org/proceedings/nesug00/st/st9005.pdf
dysmenorrhea <- array(
    c(6, 2, 1,  3, 1, 0,  1, 2, 1,
      4, 3, 0, 13, 3, 0,  8, 1, 1,
      5, 2, 2, 10, 1, 0, 14, 2, 0),
    dim = c(3, 3, 3),
    dimnames =  list(
          "Placebo" = c("None", "Moderate", "Complete"),
         "Low dose" = c("None", "Moderate", "Complete"),
        "High dose" = c("None", "Moderate", "Complete")
    )
)
dysmenorrhea <- as.table(dysmenorrhea)

## Asymptotic Madansky-Birch test (Q = 53.76)
## Note: response as ordinal
mh_test(dysmenorrhea, scores = list(response = 1:3))

## Asymptotic Madansky-Birch test (Q = 47.29)
## Note: response and measurement conditions as ordinal
mh_test(dysmenorrhea, scores = list(response = 1:3,
                                    conditions = 1:3))



