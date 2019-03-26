library(vcdExtra)


### Name: CyclingDeaths
### Title: London Cycling Deaths
### Aliases: CyclingDeaths
### Keywords: datasets

### ** Examples

data(CyclingDeaths)

plot(deaths ~ date, data=CyclingDeaths, type="h", 
	lwd=3, ylab="Number of deaths", axes=FALSE)
axis(1, at=seq(as.Date('2005-01-01'), by='years', length.out=9), labels=2005:2013)
axis(2, at=0:3)

# make a one-way frequency table
CyclingDeaths.tab <- table(CyclingDeaths$deaths)

gf <- goodfit(CyclingDeaths.tab)
gf
summary(gf)

rootogram(gf, xlab="Number of Deaths")
distplot(CyclingDeaths.tab)

# prob of 6 or more deaths in one fortnight
lambda <- gf$par$lambda
ppois(5, lambda, lower.tail=FALSE)



