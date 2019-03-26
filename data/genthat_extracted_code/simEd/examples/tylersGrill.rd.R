library(simEd)


### Name: tylersGrill
### Title: Arrival and Service Data for Tyler's Grill (University of
###   Richmond)
### Aliases: tylersGrill
### Keywords: datasets

### ** Examples

  data(tylersGrill)
  interarr <- c(0, diff(tylersGrill$arrivalTimes))
  svc      <- tylersGrill$serviceTimes

  avgInterarrivalTime <- mean(interarr)
  avgServiceTime      <- mean(svc)

  # use method of moments to fit gamma to Tyler's Grill service times
  aHat <- mean(svc)^2 / var(svc)
  bHat <- var(svc) / mean(svc)
  hist(svc, freq = FALSE, las = 1, xlab = "service time", ylab = "density")
  x <- 1:max(svc)
  curve(dgamma(x, shape = aHat, scale = bHat), add = TRUE, col = "red", lwd = 2)




