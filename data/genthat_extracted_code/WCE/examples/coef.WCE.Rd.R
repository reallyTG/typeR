library(WCE)


### Name: coef.WCE
### Title: Obtain estimated coefficients from WCE object
### Aliases: coef.WCE coef

### ** Examples

checkWCE(drugdata, id = "Id", event = "Event",  start = "Start", 
		 stop = "Stop", expos = "dose")

wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", 
		   event = "Event", start = "Start", stop = "Stop", expos = "dose", 
		   covariates = c("age", "sex"))

coef(wce)



