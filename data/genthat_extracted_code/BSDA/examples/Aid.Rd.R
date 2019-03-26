library(BSDA)


### Name: Aid
### Title: Monthly payments per person for families in the AFDC federal
###   program
### Aliases: Aid
### Keywords: datasets

### ** Examples


hist(Aid$payment, xlab = "payment", main = 
"Average monthly payment per person in a family", 
col = "lightblue")
boxplot(Aid$payment, col = "lightblue")
dotplot(state ~ payment, data = Aid)




