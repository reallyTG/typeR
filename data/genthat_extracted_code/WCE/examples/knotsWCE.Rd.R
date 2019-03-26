library(WCE)


### Name: knotsWCE
### Title: Obtain the placement of the knots used for splines in WCE models
### Aliases: knotsWCE

### ** Examples


wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event",
		   start = "Start", stop = "Stop", expos = "dose", 
		   covariates = c("age", "sex"))

knotsWCE(wce)




