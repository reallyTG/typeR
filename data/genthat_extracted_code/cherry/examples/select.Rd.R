library(cherry)


### Name: Pick
### Title: Confidence limits for the number of true hypotheses.
### Aliases: pick
### Keywords: htest

### ** Examples

  # Example: the birthwt data set from the MASS library
  # We want to find variables associated with low birth weight
  library(MASS)
  fullfit <- glm(low~age+lwt+race+smoke+ptl+ht+ui+ftv, family=binomial, data=birthwt)
  hypotheses <- c("age", "lwt", "race", "smoke", "ptl", "ht", "ui", "ftv")

  # Define the local test to be used in the closed testing procedure
  mytest <- function(hyps) {
    others <- setdiff(hypotheses, hyps)
    form <- formula(paste(c("low~",  paste(c("1", others), collapse="+"))))
    anov <- anova(glm(form, data=birthwt, family=binomial), fullfit, test="Chisq")
    res <- anov$"Pr("[2]                    # for R >= 2.14.0
    if (is.null(res)) res <- anov$"P("[2]   # earlier versions
    res
  }

  # perform the closed testing
  cl <- closed(mytest, hypotheses)
  summary(cl)

  # how many variables among a chosen set are associated with the response?
  pick(cl, c("ht", "lwt", "smoke", "ui"))



