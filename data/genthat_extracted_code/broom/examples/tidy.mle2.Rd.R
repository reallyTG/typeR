library(broom)


### Name: tidy.mle2
### Title: Tidy a(n) mle2 object
### Aliases: tidy.mle2 mle2_tidiers bbmle_tidiers

### ** Examples


if (require("bbmle", quietly = TRUE)) {
  x <- 0:10
  y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
  d <- data.frame(x,y)

  fit <- mle2(y ~ dpois(lambda = ymean),
              start = list(ymean = mean(y)), data = d)

  tidy(fit)
}




