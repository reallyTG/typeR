library(WCE)


### Name: vcov.WCE
### Title: Obtain variance-covariance matrix from WCE models
### Aliases: vcov.WCE vcov

### ** Examples

wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event",
		   start = "Start", stop = "Stop", expos = "dose", 
		   covariates = c("age", "sex"))

vcov(wce) 



