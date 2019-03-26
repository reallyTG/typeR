library(tsDyn)


### Name: llar
### Title: Locally linear model
### Aliases: llar llar.predict llar.fitted print.llar as.data.frame.llar
###   plot.llar
### Keywords: ts

### ** Examples

res <- llar(log(lynx), m=3, neps=7)
plot(res)

x.new <- llar.predict(log(lynx),n.ahead=20, m=3, eps=1, onvoid="enlarge", r=5)
lag.plot(x.new, labels=FALSE)

x.fitted <-  llar.fitted(log(lynx), m=3, eps=1)
lag.plot(x.fitted, labels=FALSE)

## Don't show: 
#bug spotted by Markus Gross in tsDyn 0.6-0
data <- seq(from=0,by=1,to=60)^2
stopifnot(all.equal(llar.predict(data, n.ahead=5, m=2, eps=800,onvoid="enlarge", r=1),
	(61:65)^2))
## End(Don't show)



