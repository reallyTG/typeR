library(ghyp)


### Name: ghyp-risk-performance
### Title: Risk and Performance Measures
### Aliases: ESghyp ghyp.omega
### Keywords: utilities misc

### ** Examples

  data(smi.stocks)

  ## Fit a NIG model to Credit Suisse and Swiss Re log-returns
  cs.fit <- fit.NIGuv(smi.stocks[, "CS"], silent = TRUE)
  swiss.re.fit <- fit.NIGuv(smi.stocks[, "Swiss.Re"], silent = TRUE)

  ## Confidence levels for expected shortfalls
  es.levels <- c(0.001, 0.01, 0.05, 0.1)

  cs.es <- ESghyp(es.levels, cs.fit)
  swiss.re.es <- ESghyp(es.levels, swiss.re.fit)

  ## Threshold levels for Omega
  threshold.levels <- c(0, 0.01, 0.02, 0.05)

  cs.omega <- ghyp.omega(threshold.levels, cs.fit)
  swiss.re.omega <- ghyp.omega(threshold.levels, swiss.re.fit)

  par(mfrow = c(2, 1))

  barplot(rbind(CS = cs.es, Swiss.Re = swiss.re.es), beside = TRUE,
          names.arg = paste(100 * es.levels, "percent"), col = c("gray40", "gray80"),
          ylab = "Expected Shortfalls (return distribution)", xlab = "Level")

  legend("bottomright", legend = c("CS", "Swiss.Re"), fill = c("gray40", "gray80"))

  barplot(rbind(CS = cs.omega, Swiss.Re = swiss.re.omega), beside = TRUE,
          names.arg = threshold.levels, col = c("gray40", "gray80"),
          ylab = "Omega", xlab = "Threshold level")
  legend("topright", legend = c("CS", "Swiss.Re"), fill = c("gray40", "gray80"))

  ## => the higher the performance, the higher the risk (as it should be)



