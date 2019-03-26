library(openintro)


### Name: cars
### Title: cars
### Aliases: cars
### Keywords: datasets

### ** Examples

data(cars)

#===> vehicle price by type <===#
par(mfrow=c(1,1))
histPlot(cars$price[cars$type=='small'], probability=TRUE,
	hollow=TRUE, xlim=c(0,50))
histPlot(cars$price[cars$type=='midsize'], probability=TRUE,
	hollow=TRUE, add=TRUE, border='red', lty=3)
histPlot(cars$price[cars$type=='large'], probability=TRUE,
	hollow=TRUE, add=TRUE, border='blue', lty=4)
legend('topright', lty=2:4, col=c('black', 'red', 'blue'),
	legend=c('small', 'midsize', 'large'))

#===> vehicle price versus weight <===#
plot(cars$weight, cars$price, col=fadeColor('magenta', '88'),
	pch=20, cex=2)

#===> mileage versus weight <===#
plot(cars$weight, cars$mpgCity, type="n")
temp <- c(seq(1000, 5000, 100), rev(seq(1000, 5000, 100)), 1000)
hold <- 87.11 - 0.03508*temp + 0.000004432*temp^2 + 7*c(rep(-1, 41), rep(1, 41), 1)
polygon(temp, hold, col="#E2E2E2",
	border=fadeColor('black', '00'))
points(cars$weight, cars$mpgCity,
	col='chocolate4', pch=20, cex=2)



