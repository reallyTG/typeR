library(afmToolkit)


### Name: afmContactPoint
### Title: Contact point
### Aliases: afmContactPoint

### ** Examples

path <- path.package("afmToolkit")
data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path)
width <- 20
mul1 <- 1
mul2 <- 10
data <- afmContactPoint(data, width = width, mul1 = mul1, mul2 = mul2)
## Not run: 
##D plot(data, segment = "approach") + geom_vline(xintercept = data$CP$CP, lty = 2)
## End(Not run)



