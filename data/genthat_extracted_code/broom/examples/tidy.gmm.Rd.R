library(broom)


### Name: tidy.gmm
### Title: Tidy a(n) gmm object
### Aliases: tidy.gmm gmm_tidiers

### ** Examples


if (requireNamespace("gmm", quietly = TRUE)) {

  library(gmm)
  
  # examples come from the "gmm" package
  ## CAPM test with GMM
  data(Finance)
  r <- Finance[1:300, 1:10]
  rm <- Finance[1:300, "rm"]
  rf <- Finance[1:300, "rf"]

  z <- as.matrix(r-rf)
  t <- nrow(z)
  zm <- rm-rf
  h <- matrix(zm, t, 1)
  res <- gmm(z ~ zm, x = h)

  # tidy result
  tidy(res)
  tidy(res, conf.int = TRUE)
  tidy(res, conf.int = TRUE, conf.level = .99)

  # coefficient plot
  library(ggplot2)
  library(dplyr)
  tidy(res, conf.int = TRUE) %>%
    mutate(variable = reorder(variable, estimate)) %>%
    ggplot(aes(estimate, variable)) +
    geom_point() +
    geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    facet_wrap(~ term) +
    geom_vline(xintercept = 0, color = "red", lty = 2)

  # from a function instead of a matrix
  g <- function(theta, x) {
  	e <- x[,2:11] - theta[1] - (x[,1] - theta[1]) %*% matrix(theta[2:11], 1, 10)
  	gmat <- cbind(e, e*c(x[,1]))
  	return(gmat) }

  x <- as.matrix(cbind(rm, r))
  res_black <- gmm(g, x = x, t0 = rep(0, 11))

  tidy(res_black)
  tidy(res_black, conf.int = TRUE)

  ## APT test with Fama-French factors and GMM

  f1 <- zm
  f2 <- Finance[1:300, "hml"] - rf
  f3 <- Finance[1:300, "smb"] - rf
  h <- cbind(f1, f2, f3)
  res2 <- gmm(z ~ f1 + f2 + f3, x = h)

  td2 <- tidy(res2, conf.int = TRUE)
  td2

  # coefficient plot
  td2 %>%
    mutate(variable = reorder(variable, estimate)) %>%
    ggplot(aes(estimate, variable)) +
    geom_point() +
    geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    facet_wrap(~ term) +
    geom_vline(xintercept = 0, color = "red", lty = 2)
}




