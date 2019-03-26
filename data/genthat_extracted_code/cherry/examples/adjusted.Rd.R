library(cherry)


### Name: Adjusted
### Title: Adjusted p-values for the number of true hypotheses.
### Aliases: adjusted
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

  # Perform the closed testing with ajdusted p-values
  cl <- closed(mytest, hypotheses, alpha=NA)

  # What is the adjusted p-value of the intersection of the following hypotheses?
  adjusted(cl, c("ht", "lwt", "smoke", "ui"))

  # From what confidence level would we conclude 
  # that more than 2 of the following hypotheses would be false?
  adjusted(cl, c("ht", "lwt", "smoke", "ui"), n=2)



