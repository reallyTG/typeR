library(EpiReport)


### Name: orderQuasinum
### Title: Order 'quasinumerical' categorical vectors (increasing order)
### Aliases: orderQuasinum
### Keywords: order

### ** Examples

age1 <- c("<1", "1-15", "16-25", ">65", "26-65")
age2 <- c("0-4", "5-10", ">65", "25-64", "11-25")
age3 <- c("5-10", ">65", "25-64", "11-25", "<=4")
age4 <- c(">=65", "<18", "18-64")
age5 <- c("5-10", "+65", "25-64", "11-25", "0-4")

age1
orderQuasinum(age1)
age2
orderQuasinum(age2)
age3
orderQuasinum(age3)
age4
orderQuasinum(age4)
age5
orderQuasinum(age5)




