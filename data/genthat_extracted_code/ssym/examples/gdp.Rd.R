library(ssym)


### Name: gdp
### Title: Gross Domestic Product (per capita)
### Aliases: gdp

### ** Examples

data("gdp", package="ssym")
par(mfrow=c(1,2))
hist(gdp$gdp2010, xlim=range(gdp$gdp2010), ylim=c(0,0.00015), prob=TRUE, breaks=55,
     col="light gray",border="dark gray", xlab="GDP per capita 2010", main="Histogram")
plot(ecdf(gdp$gdp2010), xlim=range(gdp$gdp2010), ylim=c(0,1), verticals=TRUE,
     do.points=FALSE, col="dark gray", xlab="GDP per capita 2010",
	 main="Empirical Cumulative Distribution Function")



