library(SimDesign)


### Name: EDR
### Title: Compute the empirical detection rate for Type I errors and Power
### Aliases: EDR

### ** Examples


rates <- numeric(100)
for(i in 1:100){
   dat <- rnorm(100)
   rates[i] <- t.test(dat)$p.value
}

EDR(rates)
EDR(rates, alpha = .01)

# multiple rates at once
rates <- cbind(runif(1000), runif(1000))
EDR(rates)




