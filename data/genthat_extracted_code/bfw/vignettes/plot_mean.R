## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----simulatedata, eval = FALSE------------------------------------------
#  # Create normal distributed data with mean = 0 and standard deviation = 1
#  Sigma <- matrix(0.25,3,3)
#  diag(Sigma) <- 1
#  set.seed(100)
#  data <- MASS::mvrnorm(n=1000,mu=c(0,5,10), Sigma=Sigma, empirical=TRUE)
#  colnames(data) <- c("Before","During","After")
#  
#  mcmc <- bfw::bfw(project.data = data,
#                   y = "Before,During,After",
#                   saved.steps = 50000,
#                   jags.model = "mean",
#                   job.title = "Stages of Cheese",
#                   jags.seed = 100,
#                   silent = TRUE)
#  
#  # Print output
#  round(mcmc$summary.MCMC,3)
#  #>                  Mean Median   Mode   ESS  HDIlo  HDIhi    n
#  #> mu[1]: Before       0      0  0.002 51201 -0.062  0.063 1000
#  #> mu[2]: During       5      5  5.000 50000  4.939  5.064 1000
#  #> mu[3]: After       10     10 10.000 50000  9.938 10.062 1000
#  #> sigma[1]: Before    1      1  1.000 49354  0.958  1.046 1000
#  #> sigma[2]: During    1      1  1.000 50000  0.957  1.045 1000
#  #> sigma[3]: After     1      1  0.997 50000  0.957  1.045 1000
#  Plot <- bfw::PlotMean(mcmc,
#                        run.repeated = TRUE)
#  ParsePlot(Plot)

## ----addnoise, eval = FALSE----------------------------------------------
#  set.seed(101)
#  noise <- apply(data,2, function (x) x + rbinom(length(x),1,0.7))
#  
#  noise.mcmc <- bfw::bfw(project.data = noise,
#                    y = "Before,During,After",
#                    saved.steps = 50000,
#                    jags.model = "mean",
#                    job.title = "Stages of Cheese",
#                    jags.seed = 101,
#                    silent = TRUE)
#  
#  # Print output
#  round(noise.mcmc$summary.MCMC,3)
#  #>                    Mean Median   Mode   ESS  HDIlo  HDIhi    n
#  #> mu[1]: Before     0.713  0.713  0.713 50000  0.641  0.781 1000
#  #> mu[2]: During     5.686  5.686  5.690 48350  5.618  5.756 1000
#  #> mu[3]: After     10.686 10.686 10.685 50648 10.617 10.753 1000
#  #> sigma[1]: Before  1.120  1.119  1.116 50000  1.072  1.170 1000
#  #> sigma[2]: During  1.116  1.116  1.112 50000  1.068  1.166 1000
#  #> sigma[3]: After   1.101  1.100  1.097 49233  1.054  1.151 1000
#  Plot <- bfw::PlotMean(noise.mcmc,
#                        run.repeated = TRUE)
#  ParsePlot(Plot)

## ----addgroup, eval = FALSE----------------------------------------------
#  combined.data <- as.data.frame(rbind(cbind(data,"Y"), cbind(noise,"X") ), stringsAsFactors=FALSE)
#  combined.data[,1:3] <- lapply(combined.data[,1:3] , as.numeric)
#  combined.data[,4] <- as.factor(combined.data[,4])
#  colnames(combined.data) <- c(colnames(data), "Groups")
#  
#  combined.data <- bfw::bfw(project.data = combined.data,
#                       y = "Before,During,After",
#                       x = "Groups",
#                       job.title = "Stages of Cheese",
#                       saved.steps = 50000,
#                       jags.model = "mean",
#                       jags.seed = 102,
#                       silent = TRUE)
#  
#  # Print output
#  round(combined.data$summary.MCMC[, 3:7],3)
#  #>                                   Mode   ESS  HDIlo  HDIhi    n
#  #> mu[1]: Before                    0.359 50000  0.309  0.407 2000
#  #> mu[2]: Before vs. Groups @ X     0.713 50000  0.641  0.779 1000
#  #> mu[3]: Before vs. Groups @ Y    -0.002 50000 -0.063  0.062 1000
#  #> mu[4]: During                    5.342 50000  5.293  5.391 2000
#  #> mu[5]: During vs. Groups @ X     5.683 49103  5.616  5.754 1000
#  #> mu[6]: During vs. Groups @ Y     4.998 50000  4.938  5.062 1000
#  #> mu[7]: After                    10.344 50000 10.293 10.390 2000
#  #> mu[8]: After vs. Groups @ X     10.688 49245 10.618 10.754 1000
#  #> mu[9]: After vs. Groups @ Y      9.999 50000  9.938 10.063 1000
#  #> sigma[1]: Before                 1.119 50000  1.086  1.155 2000
#  #> sigma[2]: Before vs. Groups @ X  1.119 48125  1.071  1.169 1000
#  #> sigma[3]: Before vs. Groups @ Y  0.998 50000  0.958  1.045 1000
#  #> sigma[4]: During                 1.112 50000  1.079  1.148 2000
#  #> sigma[5]: During vs. Groups @ X  1.115 49356  1.068  1.165 1000
#  #> sigma[6]: During vs. Groups @ Y  0.999 50000  0.957  1.045 1000
#  #> sigma[7]: After                  1.105 50000  1.072  1.140 2000
#  #> sigma[8]: After vs. Groups @ X   1.098 50000  1.054  1.150 1000
#  #> sigma[9]: After vs. Groups @ Y   1.000 50000  0.957  1.045 1000
#  
#  # Let's also add some colors!
#  Plot <- bfw::PlotMean(combined.data,
#                        run.split = TRUE,
#                        run.repeated = TRUE,
#                        monochrome = FALSE)
#  ParsePlot(Plot)

