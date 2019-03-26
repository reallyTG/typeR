library(afmToolkit)


### Name: afmDetachPoint
### Title: Detach point
### Aliases: afmDetachPoint

### ** Examples

data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path.package("afmToolkit"))
width <- 10
mul1 <- 2
mul2 <- 40
data <- afmDetachPoint(data, width = width, mul1 = mul1, mul2 = mul2)
## Not run: 
##D plot(data, segment = "retract") + geom_vline(xintercept = data$DP$DP, lty = 2)
## End(Not run)



