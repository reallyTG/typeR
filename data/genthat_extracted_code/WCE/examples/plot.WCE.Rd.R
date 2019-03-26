library(WCE)


### Name: plot.WCE
### Title: Plot of the weight function(s) estimated by 'WCE'
### Aliases: plot.WCE plot

### ** Examples


wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event", 
		   start = "Start", stop = "Stop", expos = "dose", covariates = c("age", "sex"))

plot(wce)



