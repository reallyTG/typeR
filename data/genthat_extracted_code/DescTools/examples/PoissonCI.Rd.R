library(DescTools)


### Name: PoissonCI
### Title: Poisson Confidence Interval
### Aliases: PoissonCI
### Keywords: univar

### ** Examples

# the horse kick example
count <- 0:4
deaths <- c(144, 91, 32, 11, 2)

n <- sum(deaths)
x <- sum(count * deaths)

lambda <- x/n

PoissonCI(x=x, n=n, method = c("exact","score", "wald", "byar"))

exp <- dpois(0:4, lambda) * n

barplot(rbind(deaths, exp * n/sum(exp)), names=0:4, beside=TRUE,
  col=c(hred, hblue), main = "Deaths from Horse Kicks", xlab = "count")
legend("topright", legend=c("observed","expected"), fill=c(hred, hblue),
  bg="white")


## SMR, Welsh Nickel workers
PoissonCI(x=137, n=24.19893)



