library(BSDA)


### Name: Rentals
### Title: Weekly rentals for 45 apartments
### Aliases: Rentals
### Keywords: datasets

### ** Examples


stem(Rentals$rent)
sum(Rentals$rent < mean(Rentals$rent) - 3*sd(Rentals$rent) | 
   Rentals$rent > mean(Rentals$rent) + 3*sd(Rentals$rent))




