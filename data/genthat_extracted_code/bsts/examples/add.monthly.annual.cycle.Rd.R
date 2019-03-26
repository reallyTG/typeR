library(bsts)


### Name: add.monthly.annual.cycle
### Title: Monthly Annual Cycle State Component
### Aliases: AddMonthlyAnnualCycle MonthlyAnnualCycle

### ** Examples


  ## Let's simulate some fake daily data with a monthly cycle.
## Not run: 
##D   residuals <- rnorm(365 * 5)
## End(Not run)
## Don't show: 
  residuals <- rnorm(365 * 2)
## End(Don't show)
  n <- length(residuals)
  dates <- seq.Date(from = as.Date("2014-01-01"),
                    len = n,
                    by = 1)
  monthly.cycle <- rnorm(12)
  monthly.cycle <- monthly.cycle - mean(monthly.cycle)
  timestamps <- as.POSIXlt(dates)
  month <- timestamps$mon + 1

  new.month <- c(TRUE, diff(timestamps$mon) != 0)
  month.effect <- cumsum(new.month) 
  month.effect[month.effect == 0] <- 12

  response <- monthly.cycle[month] + residuals
  response <- zoo(response, timestamps)

  ## Now let's fit a bsts model to the daily data with a monthly annual
  ## cycle.
  ss <- AddLocalLevel(list(), response)
  ss <- AddMonthlyAnnualCycle(ss, response)

  ## In real life you'll probably want more iterations.
  model <- bsts(response, state.specification = ss, niter = 250)
  plot(model)
  plot(model, "monthly")



