library(TRSbook)


### Name: crosschart
### Title: A cross chart
### Aliases: crosschart

### ** Examples

data(NUTRIELDERLY)
attach(NUTRIELDERLY)
situation <- as.factor(situation)
levels(situation) <- c("single","couple","family","other")
crosschart(situation,col=c("orange","darkgreen","black","tan"))
detach(NUTRIELDERLY)



