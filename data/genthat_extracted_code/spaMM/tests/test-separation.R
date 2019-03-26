if (FALSE) { ## useful to have it handy, but not useful to test on a routine basis
  cat("\ntest separation:")
  
  ## A set of 4 completely separated sample points ##
  x <- c(-2, -1, 1, 2)
  y <- c(0, 0, 1, 1)
  
  #safeBinaryRegression::glm(y ~ x, family = binomial())
  #stats::glm(y ~ x, family = binomial()) ## slightly cryptic warning!
  HLfit(y ~ x, family = binomial(), data=data.frame(x,y))
  
  
  ## A set of 4 quasicompletely separated sample points ##
  x <- c(-2, 0, 0, 2)
  y <- c(0, 0, 1, 1)
  
  #safeBinaryRegression::glm(y ~ x, family = binomial())
  #stats::glm(y ~ x, family = binomial()) ## detects nothing !
  HLfit(y ~ x, family = binomial(), data=data.frame(x,y))
}
