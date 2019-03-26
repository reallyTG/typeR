library(WCE)


### Name: HR.WCE
### Title: Obtain a hazard ratio (HR) from a WCE Cox proportional hazards
###   model
### Aliases: HR.WCE

### ** Examples

wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event",
		   start = "Start", stop = "Stop", expos = "dose", 
		   covariates = c("age", "sex"))

# Exposed at a dose of 1 (constant) vs. unexposed over the time window of 90 days
scenario1 <- rep(1, 90)
scenario2 <- rep(0, 90)
HR.WCE(wce, vecnum = scenario1, vecdenom = scenario2)



