## ----detection function, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 6, fig.cap="Figure 1: An Example detection function. The histogram shows example distances recorded from a line transect. The smooth curve is the detection function. The grey shaded area represents the number of detected objects and the diagonal hash region represents the number of objects in the covered region that were not detected."----
x <- seq(0, 70, length = 200)
scale <- 25
y <- exp(-x^2/(2*scale^2))

plot(x,y, type = "l", xlab = "Distance", ylab = "Probability of Detection", main = "Example Detection Function")

coords.x <- c(0,x,70,0)
coords.y <- c(0,y,0,0)
polygon(coords.x, coords.y, col = "grey")

coords.x <- c(0,70,x[200:1])
coords.y <- c(1,1,y[200:1])
polygon(coords.x, coords.y, density = 10, angle = 45)

norm.vals <- abs(rnorm(1000,0,25))
temp <- hist(norm.vals, plot = FALSE)
temp$density <- temp$density/temp$density[1]
plot(temp, freq = FALSE, add = TRUE)

## ----S4eg, warning=FALSE, message=FALSE, echo=TRUE-----------------------

# load DSsim
library(DSsim)
# Make a default region object
eg.region <- make.region()
# Let's check the structure of the object we have created
str(eg.region)
# If we wanted to extract the area of the region we would use
eg.region@area

## ----trunc dists1, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 6, fig.cap="Figure 3: Half-normal detection function showing 3 proposed truncation distances at $1*\\sigma$, $2*\\sigma$ and $3*\\sigma$. The truncation distance at twice sigma gives a probability of detection of 0.135 so close to the 0.15 rule of thumb."----

x <- seq(0, 80, length = 200)
scale <- 25
y <- exp(-x^2/(2*scale^2))

plot(x,y, type = "l", xlab = "Distance", ylab = "Probability of Detection", main = "Half-Normal Detection Function (sigma = 25)", lwd = 3)

# Add lines for truncation distances
x.lines <- c(25,50,75)
y.lines <- exp(-x.lines^2/(2*scale^2))

for(i in seq(along = x.lines)){
  lines(c(x.lines[i],x.lines[i]), c(0,y.lines[i]), col = 2, lwd = 3)
}


## ----trunc dists2, warning=FALSE, message=FALSE, echo=FALSE, fig.width = 7.2, fig.cap="Figure 4: Half-normal detection function which varies based on cluster size and animal sex."----

covariate.list <- list()
covariate.list$size <- list(list("poisson", list(lambda = 35)))
covariate.list$sex <- list(data.frame(level = c("male", "female"), 
                                      prob = c(0.5,0.5)))
# Create covariate description
pop.desc <- make.population.description(covariates = covariate.list)

# define covariate parameters
cov.params <- list(size = c(0.015), 
                   sex = data.frame(level = c("male", "female"),
                                    param = c(0.9, -0.1)))

detect <- make.detectability(scale.param = 10, 
                             cov.param = cov.params, 
                             truncation = 60)

plot(detect, pop.desc)


## ----setup, warning=FALSE, message=FALSE---------------------------------
library(DSsim)

## ----region, warning=FALSE, message=FALSE, fig.width=4, fig.cap="Figure 5: The study region."----
# Create a polgon
poly1 <- data.frame(x = c(0,0,20000,20000,0), y = c(0,5000,5000,0,0))

# Create an empty list
coords <- list()
# Store the polygon inside a list in the first element of the coords list referring to strata 1.
coords[[1]] <- list(poly1)

# Create the survey region
region <- make.region(region.name = "study area", 
                      units = "m",
                      coords = coords)
# The plot function allows plotting in km or m.
plot(region, plot.units = "km")


## ----density, warning=FALSE, message=FALSE, fig.width=4, fig.cap="Figure 6: The density surface."----

# Create the density surface
density <- make.density(region.obj = region, 
                        x.space = 50, 
                        y.space = 200, 
                        constant = 1)

# Plot the density surface (can be in 'm' or 'km')
# Note that if converting units the values of the density surface are also converted
# In this example they are plotted in animals per square km instead of per square m.
plot(density, style = "blocks", plot.units = "km")
plot(region, add = TRUE)

## ----density2, warning=FALSE, message=FALSE, fig.width=4, fig.cap="Figure 7: The density surface."----

# Add a hotspot to the density surface, centre located at x = 15000, y = 4000 with 
# a Gaussian decay parameter sigma = 1500. The value at the centre point will now 
# be 1 (the current value of the density surface defined above) + 0.5 = 1.5
eg.density <- add.hotspot(density, centre = c(15000,4000), sigma = 1500, amplitude = 0.5)
# Add a lowspot to this new density surface (eg.density)
eg.density <- add.hotspot(eg.density, centre = c(10000,3000), sigma = 1000, amplitude = -0.25)
# Plot the density surface
plot(eg.density, style = "blocks", plot.units = "m")
plot(region, add = TRUE)


## ----popdesc1, warning=FALSE, message=FALSE------------------------------

# Create the population description, with a population size N = 200
pop.desc <- make.population.description(region.obj = region, 
                                            density.obj = density, 
                                            N = 200)


## ----popdesc2, warning=FALSE, message=FALSE------------------------------

# Create the covariate list
covariate.list <- list()
# The population will be 50% males and 50% females
covariate.list$sex <- list(data.frame(level = c("female", "male"), prob = c(0.5,0.5)))

# Create the population description, with a population size N = 200
pop.desc.cov <- make.population.description(region.obj = region, 
                                            density.obj = density, 
                                            covariates = covariate.list, 
                                            N = 200)


## ----detect1, warning=FALSE, message=FALSE, fig.width=4, fig.cap="Figure 8: The detection functions for males and females."----

# Make a simple half normal detection function with a scale parameter of 200
detect.hn <- make.detectability(key.function = "hn",
                                 scale.param = 200, 
                                 truncation = 1000)

# We can now visualise these detection functions
plot(detect.hn, pop.desc)

## ----detect2, warning=FALSE, message=FALSE, fig.width=4, fig.cap="Figure 9: The detection functions for males and females."----

# Create the covariate parameter list
cov.params <- list()
# Note the covariate parameters are supplied on the log scale
cov.params$sex = data.frame(level = c("female", "male"), 
                            param = c(0, 1.5))

detect.cov <- make.detectability(key.function = "hn" ,
                                 scale.param = 120,
                                 cov.param = cov.params, 
                                 truncation = 1000)

# This setup gives a scale parameter of around 120 for the females and 540 for 
# the males. We can calculate the sigma for the males using the formula above:
# exp(log(scale.param) + sex.male)
exp(log(120) + 1.5)

# We can now visualise these detection functions
plot(detect.cov, pop.desc.cov)

## ----design, warning=FALSE, message=FALSE--------------------------------

# Define the design
design <- make.design(transect.type = "line",
                      design.details = c("parallel", "systematic"),
                      region.obj = region,
                      spacing = 1000)


## ----transects, warning=FALSE, message=FALSE, echo = TRUE, fig.width=4, fig.cap="Figure 10: Example survey transects."----

transects <- generate.transects(design, region = region)
plot(region, plot.units = "km")
plot(transects, col = 4, lwd = 2)

## ----analyses1-----------------------------------------------------------
ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn", formula = ~1),
                                                      ~cds(key = "hr", formula = ~1)), 
                                       method = "ds",
                                       criteria = "AIC",
                                       truncation = 600)

## ----analyses2-----------------------------------------------------------
ddf.analyses.cov <- make.ddf.analysis.list(dsmodel = list(~mcds(key = "hn", formula = ~sex)), 
                                           method = "ds",
                                           truncation = 600)

## ----set.seed, echo = FALSE, eval = TRUE---------------------------------
set.seed(474)

## ----check.sim, fig.height=5.5, fig.width=7.2, fig.cap="Figure 11: Example survey. Top left - the density suface with an example population. Top right - an example set of transects. Bottom left - the detections from the transects. Bottom right - A histogram of the distances from these observations to the transect it was detected."----
sim <- make.simulation(reps = 999, 
                       region.obj = region,
                       design.obj = design,
                       population.description.obj = pop.desc,
                       detectability.obj = detect.hn,
                       ddf.analyses.list = ddf.analyses)
# Produce simulation setup plots
check.sim.setup(sim)

## ----check.sim2, fig.height=5.5, fig.width=7.2, fig.cap="Figure 12: Example survey."----
sim.cov <- make.simulation(reps = 999, 
                       region.obj = region,
                       design.obj = design,
                       population.description.obj = pop.desc.cov,
                       detectability.obj = detect.cov,
                       ddf.analyses.list = ddf.analyses)
# Produce simulation setup plots
check.sim.setup(sim.cov)

## ----run.sim1, eval = FALSE----------------------------------------------
#  
#  # Truncation distances to iterate over
#  truncation <- c(200, 400, 600)
#  # Storage space for results
#  results.list <- list()
#  summary.list <- list()
#  
#  # We will now run the simulation for each of the analysis truncation distances.
#  for(tdist in seq(along= truncation)){
#    # Screen display to indicate how far through the simulations we are
#    cat("\n Running for truncation = ", truncation[tdist], fill = T)
#    # Update analysis truncation distance
#    new.ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn", formula = ~1),
#                                                              ~cds(key = "hr", formula = ~1)),
#                                               method = "ds",
#                                               criteria = "AIC",
#                                               truncation = truncation[tdist])
#    # Update simulation to include new analysis component
#    # We can use the @ symbol to change the contents of a slot or alternatively we could have
#    # re created the simulation with the new analyses using make.simulation().
#    sim@ddf.analyses <- new.ddf.analyses
#    # Run simulation and store the results in the appropriate list element
#    results.list[[tdist]] <- run(sim)
#    # Store simulation summary in another list in the appropriate list element
#    # As we are storing the summary we do not need the description.summary displayed
#    summary.list[[tdist]] <- summary(results.list[[tdist]], description.summary = FALSE)
#  }
#  
#  # Add names to the summary and results list so we know which truncation distance they
#  # relate to
#  names(results.list) <- paste("t", truncation, sep = "")
#  names(summary.list) <- paste("t", truncation, sep = "")
#  

## ----covtruncation, eval = TRUE, echo = FALSE, fig.width=4, fig.cap="Figure 13: Histogram of data from covariate simulation with an increased population size of 2500. The detection function shows the best fit to the data (the code was allowed to select between a half normal and hazard rate based on minimum AIC). The red lines indicate the manually selected candidate truncation distances."----
#{r covtruncation, eval = TRUE, echo = FALSE, fig.path = "images/", fig.keep = #'last', fig.show = 'asis', dev = 'png', fig.width=4, fig.cap="Figure 13: Histogram #of data from covariate simulation with an increased population size of 5000. The #detection function shows the best fit to the data (the code was allowed to select #between a half normal and hazard rate based on minimum AIC). The red lines indicate #the selected candidate truncation distances."}
# This code was used to generate the image above. It takes a long time to 
# run so saving the image seemed preferable to running ofr each recompile
set.seed(2320)
temp <- sim.cov
temp@population.description@N <- 2500
eg.survey <- create.survey.results(temp)
ddf.dat <- eg.survey@ddf.data@ddf.dat
n <- nrow(ddf.dat)
plot.title <- paste("Detection Distances (n=", n,")", sep = "")
temp2 <- hist(ddf.dat$distance, breaks = 20, plot = FALSE)
temp2$density <- temp2$density/temp2$density[1]

#png(filename = "CovTruncation.png", width = 4.5, height = 3, units = "in", res = 200)

plot(temp2, freq = FALSE, xlab = "Distance (m)", ylab = "Probability of Detection", main = "Detection Distances")

ddf.result.hn <- ddf(dsmodel = ~cds(key = "hn"), data = ddf.dat, meta.data = list(width = 1000))
ddf.result.hr <- ddf(dsmodel = ~cds(key = "hr"), data = ddf.dat, meta.data = list(width = 1000))

min.AIC <- min(ddf.result.hn$criterion, ddf.result.hr$criterion)
index <- which(c(ddf.result.hn$criterion, ddf.result.hr$criterion) == min.AIC)

x.vals <- seq(0, temp@detectability@truncation, length = 200)
trunc.vals <- c(200, 400, 600, 800, 1000)
if(index ==1){
  scale <- exp(ddf.result.hn$par)
  y.vals <- exp(-x.vals^2/(2*scale^2))
  trunc.y <- exp(-trunc.vals^2/(2*scale^2))
}else{
  scale <- exp(ddf.result.hr$par[2])
  shape <- exp(ddf.result.hr$par[1])
  y.vals <- 1-exp(-(x.vals/scale)^-shape)
  trunc.y <- 1-exp(-(trunc.vals/scale)^-shape)
  rm(shape)
}

lines(x.vals, y.vals, lwd = 3)

for(i in seq(along = trunc.vals)){
  lines(x = rep(trunc.vals[i],2), y = c(0,trunc.y[i]), lwd = 3, col = 2)
}

rm(temp, temp2, ddf.result.hn, ddf.result.hr, eg.survey, n, ddf.dat, plot.title, min.AIC, trunc.vals, scale, y.vals, trunc.y, x.vals, i)

#dev.off()

## ----check.sim4, eval = FALSE--------------------------------------------
#  
#  # Truncation distances to iterate over
#  truncation <- c(200, 400, 600, 800, 1000)
#  # Storage space for results
#  cov.results.list <- list()
#  cov.summary.list <- list()
#  
#  for(tdist in seq(along= truncation)){
#    # Screen display to indicate how far through the simulations we are
#    cat("\n Running for truncation = ", truncation[tdist], fill = T)
#    # Update analysis truncation distance
#    new.ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~cds(key = "hn", formula = ~1),
#                                                              ~cds(key = "hr", formula = ~1)),
#                                               method = "ds",
#                                               criteria = "AIC",
#                                               truncation = truncation[tdist])
#    # Update simulation
#    sim.cov@ddf.analyses <- new.ddf.analyses
#    # Run Simulation
#    cov.results.list[[tdist]] <- run(sim.cov)
#    # Store simulation summaries
#    cov.summary.list[[tdist]] <- summary(cov.results.list[[tdist]], description.summary = FALSE)
#  }
#  # Add names to the summary and results list
#  names(cov.results.list) <- paste("t", truncation, sep = "")
#  names(cov.summary.list) <- paste("t", truncation, sep = "")

## ----covsimulation, eval = FALSE-----------------------------------------
#  # Now include the ddf.analyses.cov in the simulation
#  sim.cov <- make.simulation(reps = 999,
#                         region.obj = region,
#                         design.obj = design,
#                         population.description.obj = pop.desc.cov,
#                         detectability.obj = detect.cov,
#                         ddf.analyses.list = ddf.analyses.cov)
#  
#  # Truncation distances to iterate over
#  truncation <- c(200, 400, 600, 800, 1000)
#  
#  # Storage space for results
#  covmod.results.list <- list()
#  covmod.summary.list <- list()
#  
#  for(tdist in seq(along= truncation)){
#    # Screen display to indicate how far through the simulations we are
#    cat("\n Running for truncation = ", truncation[tdist], fill = T)
#    # Update analysis truncation distance so that detecability is now modelled as a function of sex
#    new.ddf.analyses <- make.ddf.analysis.list(dsmodel = list(~mcds(key = "hn", formula = ~sex)),
#                                               method = "ds",
#                                               criteria = "AIC",
#                                               truncation = truncation[tdist])
#    # Update simulation
#    sim.cov@ddf.analyses <- new.ddf.analyses
#    # Run Simulation
#    covmod.results.list[[tdist]] <- run(sim.cov)
#    # Store simulation summaries
#    covmod.summary.list[[tdist]] <- summary(covmod.results.list[[tdist]], description.summary = FALSE)
#  }
#  # Add names to the summary and results list
#  names(covmod.results.list) <- paste("t", truncation, sep = "")
#  names(covmod.summary.list) <- paste("t", truncation, sep = "")

## ----covsimulation2, eval = FALSE----------------------------------------
#  sim.cov <- make.simulation(reps = 999,
#                         region.obj = region,
#                         design.obj = design,
#                         population.description.obj = pop.desc.cov,
#                         detectability.obj = detect.cov,
#                         ddf.analyses.list = ddf.analyses.cov)
#  
#  # Truncation distances to iterate over
#  truncation <- c(200, 400, 600, 800, 1000)
#  reps <- sim.cov@reps
#  
#  # To store values of interest
#  sigma.est <- male.param <- array(NA,
#                                   dim = c(length(truncation), reps),
#                                   dimnames = list(truncation, 1:reps))
#  
#  # Iterate over truncation distances
#  for(tdist in seq(along = truncation)){
#    # Screen display to indicate how far through the simulations we are
#    cat("\n Running for truncation = ", truncation[tdist], fill = T)
#    # Update truncation distance
#    ddf.analyses.cov <- make.ddf.analysis.list(dsmodel = list(~mcds(key = "hn", formula = ~sex)),
#                                             method = "ds",
#                                             truncation = truncation[tdist])
#    sim.cov@ddf.analyses <- ddf.analyses.cov
#    # Simulation repetitions
#    for(i in 1:reps){
#      cat("\r", i, " out of ", reps,  " reps \r")
#      # Simulates the survey process
#      simulated.data <- create.survey.results(sim.cov)
#      # Run analyses
#      results <- run.analysis(sim.cov, simulated.data)
#      # Obtain detection function model
#      ddf.results <- results$ddf
#      # Store values of interest
#      sigma.est[tdist,i] <- ddf.results$par[1]
#      male.param[tdist,i] <- ddf.results$par[2]
#    }
#  }
#  
#  

## ----runparallel, eval = FALSE, echo = TRUE------------------------------
#  # Running simulations in parallel
#  run(sim.cov, run.parallel = TRUE, max.cores = 7)

## ----loadresults, eval = TRUE, echo = TRUE-------------------------------

# Simulations using a simple half normal detection function
data(trunc_summary)

# Covartiate simulations
data(trunc_cov_summary)

# Covariate simulations with covariate model
data(covmod_summary)
data(cov_param)

## ----displaysummary, eval = FALSE, echo = TRUE---------------------------
#  
#  # To view the full summary for the simple half normal simulation with a truncation distance of 200:
#  summary.list$t200
#  
#  # To view the full summary for the covariate simulation with a truncation distance of 600:
#  cov.summary.list$t600
#  

## ----maketables, eval = FALSE, echo = TRUE-------------------------------
#  
#  library(knitr)
#  
#  N    <- unlist(lapply(summary.list, function(x){x@individuals$N$mean.Estimate}))
#  n    <- unlist(lapply(summary.list, function(x){x@individuals$summary$mean.n}))
#  se   <- unlist(lapply(summary.list, function(x){x@individuals$N$mean.se}))
#  sd.N <- unlist(lapply(summary.list, function(x){x@individuals$N$sd.of.means}))
#  bias <- unlist(lapply(summary.list, function(x){x@individuals$N$percent.bias}))
#  RMSE <- unlist(lapply(summary.list, function(x){x@individuals$N$RMSE}))
#  cov  <- unlist(lapply(summary.list, function(x){x@individuals$N$CI.coverage.prob}))
#  
#  sim.data <- data.frame(trunc = c(200,400,600),
#                         n = round(n),
#                         N = round(N),
#                         se = round(se,2),
#                         sd.N = round(sd.N,2),
#                         bias = round(bias,2),
#                         RMSE = round(RMSE,2),
#                         cov = round(cov*100,1))
#  
#  kable(sim.data,
#        col.names = c("$Truncation$", "$mean\\ n$", "$mean\\ \\hat{N}$", "$mean\\ se$", "$SD(\\hat{N})$", "$\\% Bias$", "$RMSE$", "$\\%\\ CI\\ Coverage$"),
#        row.names = FALSE,
#        align = c('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
#        caption = "Simulation Results for the simple half normal detection probability: The truncation distance, mean number of detections, mean estimated population size (N), mean standard error of $\\hat{N}$, the standard deviation of $\\hat{N}$, percentage bias, root mean squared error, percentage of times the true value of N was captured in the confidence intervals.",
#        table.placement="!h",
#        format = "html")
#  

## ----maketables1, eval = TRUE, echo = FALSE------------------------------

library(knitr)

N    <- unlist(lapply(summary.list, function(x){x@individuals$N$mean.Estimate}))
n    <- unlist(lapply(summary.list, function(x){x@individuals$summary$mean.n}))
se   <- unlist(lapply(summary.list, function(x){x@individuals$N$mean.se}))
sd.N <- unlist(lapply(summary.list, function(x){x@individuals$N$sd.of.means}))
bias <- unlist(lapply(summary.list, function(x){x@individuals$N$percent.bias}))
RMSE <- unlist(lapply(summary.list, function(x){x@individuals$N$RMSE}))
cov  <- unlist(lapply(summary.list, function(x){x@individuals$N$CI.coverage.prob}))

sim.data <- data.frame(trunc = c(200,400,600), 
                       n = round(n),
                       N = round(N),
                       se = round(se,2),
                       sd.N = round(sd.N,2),
                       bias = round(bias,2),
                       RMSE = round(RMSE,2),
                       cov = round(cov*100,1))

kable(sim.data, 
      col.names = c("$Truncation$", "$mean\\ n$", "$mean\\ \\hat{N}$", "$mean\\ se$", "$SD(\\hat{N})$", "$\\% Bias$", "$RMSE$", "$\\%\\ CI\\ Coverage$"),
      row.names = FALSE,
      align = c('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
      caption = "Table 1: Simulation Results for the simple half normal detection probability. The truncation distance, mean number of detections, mean estimated population size (N), mean standard error of $\\hat{N}$, the standard deviation of $\\hat{N}$, percentage bias, root mean squared error, percentage of times the true value of N was captured in the 95% confidence intervals.",
      table.placement="!h",
      format = "html")


## ----maketables2, eval= TRUE, echo = FALSE-------------------------------

N    <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$mean.Estimate}))
n    <- unlist(lapply(cov.summary.list, function(x){x@individuals$summary$mean.n}))
se   <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$mean.se}))
sd.N <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$sd.of.means}))
bias <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$percent.bias}))
RMSE <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$RMSE}))
cov  <- unlist(lapply(cov.summary.list, function(x){x@individuals$N$CI.coverage.prob}))

sim.data <- data.frame(trunc = c(200,400,600,800,1000), 
                       n = round(n),
                       N = round(N),
                       se = round(se,2),
                       sd.N = round(sd.N,2),
                       bias = round(bias,2),
                       RMSE = round(RMSE,2),
                       cov = round(cov*100,1))

kable(sim.data, 
      col.names = c("$Truncation$", "$mean\\ n$", "$mean\\ \\hat{N}$", "$mean\\ se$", "$SD(\\hat{N})$", "$\\% Bias$", "$RMSE$", "$\\%\\ CI\\ Coverage$"),
      row.names = FALSE,
      align = c('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
      caption = "Table 2: Simulation Results for the covariate detection probability, where detectability is affected by sex but the candidate models (half-normal and hazard rate) do not contain covariates. The truncation distance, mean number of detections, mean estimated population size (N), mean standard error of $\\hat{N}$, the standard deviation of $\\hat{N}$, percentage bias, root mean squared error, percentage of times the true value of N was captured in the 95% confidence intervals.",
      table.placement="!h",
      format = "html")


## ----maketables3, eval= TRUE, echo = FALSE-------------------------------

N    <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$mean.Estimate}))
n    <- unlist(lapply(covmod.summary.list, function(x){x@individuals$summary$mean.n}))
se   <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$mean.se}))
sd.N <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$sd.of.means}))
bias <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$percent.bias}))
RMSE <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$RMSE}))
cov  <- unlist(lapply(covmod.summary.list, function(x){x@individuals$N$CI.coverage.prob}))

sim.data <- data.frame(trunc = c(200,400,600,800,1000), 
                       n = round(n),
                       N = round(N),
                       se = round(se,2),
                       sd.N = round(sd.N,2),
                       bias = round(bias,2),
                       RMSE = round(RMSE,2),
                       cov = round(cov*100,1))

kable(sim.data, 
      col.names = c("$Truncation$", "$mean\\ n$", "$mean\\ \\hat{N}$", "$mean\\ se$", "$SD(\\hat{N})$", "$\\% Bias$", "$RMSE$", "$\\%\\ CI\\ Coverage$"),
      row.names = FALSE,
      align = c('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
      caption = "Table 3: Simulation Results for the covariate detection probability, where detectability is affected by sex and this is modelled in the detection function. The truncation distance, mean number of detections, mean estimated population size (N), mean standard error of $\\hat{N}$, the standard deviation of the $\\hat{N}$, percentage bias, root mean squared error, percentage of times the true value of N was captured in the 95% confidence intervals.",
      table.placement="!h",
      format = "html")


## ----makeplots, eval= TRUE, echo = FALSE, fig.width=7.2, fig.cap="Figure 14: Histograms of the parameter estimates for sigma and sex.male for three of the five truncation distances investigated."----
truncation <- c("200" , "600" , "1000" )
oldpar <- par(mfrow = c(2,length(truncation)))

sigma.est <- param.list$sigma
male.param <- param.list$sex.male

for(i in seq(along = truncation)){
  # histogram of the sigma estimates
  hist(exp(sigma.est[truncation[i],]), xlab = "Estimate of sigma", main = paste("Truncation = ",truncation[i], sep = ""))
  abline(v = sim.cov@detectability@scale.param, col = 2, lwd = 2)
  
}
for(i in seq(along = truncation)){
# histogram of the male cov estimates
  hist(male.param[truncation[i],], xlab = "Estimate of sex.male", main = "")
  abline(v = sim.cov@detectability@cov.param$sex$param[sim.cov@detectability@cov.param$sex$level == "male"], col = 2, lwd = 2)
}

par(oldpar)

