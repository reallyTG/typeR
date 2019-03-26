library(areaplot)


### Name: areaplot
### Title: Area Plot
### Aliases: areaplot areaplot.default areaplot.formula

### ** Examples

areaplot(rpois(10,40))
areaplot(rnorm(10))

# formula
areaplot(Armed.Forces~Year, data=longley)
areaplot(cbind(Armed.Forces,Unemployed)~Year, data=longley)
areaplot(.~Year, data=longley)

# add=TRUE
plot(1940:1970, 500*runif(31), ylim=c(0,500))
areaplot(Armed.Forces~Year, data=longley, add=TRUE)

# data frame
mydata <- longley[c("Year","GNP")]
areaplot(mydata)

# matrix
areaplot(WorldPhones)
areaplot(WorldPhones, prop=TRUE)

# table
require(MASS)
areaplot(table(Aids2$age))
areaplot(table(Aids2$age, Aids2$sex))

# ts/mts
areaplot(austres)
areaplot(Seatbelts[,c("drivers","front","rear")],
         ylab="Killed or seriously injured")
abline(v=1983+1/12, lty=3)

# legend
areaplot(table(Aids2$age, Aids2$sex), legend=TRUE)
areaplot(WorldPhones, legend=TRUE, args.legend=list(x="topleft"))




