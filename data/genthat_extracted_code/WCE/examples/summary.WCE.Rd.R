library(WCE)


### Name: summary.WCE
### Title: Method to summarize the results of a WCE object
### Aliases: summary.WCE summary

### ** Examples

wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event",
		   start = "Start", stop = "Stop", expos = "dose", covariates = c("age", "sex"))

summary(wce)



