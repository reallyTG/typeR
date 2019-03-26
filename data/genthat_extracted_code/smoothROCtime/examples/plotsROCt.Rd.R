library(smoothROCtime)


### Name: plot.sROCt
### Title: Plots of time-dependent ROC curve estimations
### Aliases: plot.sROCt

### ** Examples

library(smoothROCtime)
require(survival)

# Monoclonal Gammapothy of Undetermined Significance dataset
  data(mgus)

# Time-to-event
  time   <- ifelse(is.na(mgus$pctime), mgus$futime,mgus$pctime)

# Status
  status <- ifelse(is.na(mgus$pctime), 0, 1)

# Preparing data
  DT <-as.data.frame(cbind(log(time), status, mgus$alb))
  colnames(DT) <- c("futime", "pcm", "alb")
  dta <-  na.omit(cbind(DT$futime, DT$pcm, -DT$alb))

# Point of Time
  t10 <- log(10*365.25) # ten years in logarithm scale

# Cumulative/Dynamic and Incident dynamic ROC curve estimations at t=10 years
  rcu <- stRoc(data=dta, t=t10, tcr="B", meth = "1", verbose=TRUE)

# Plots of both ROC curve estimations
  plot(rcu, tcr="B", frame=FALSE)



