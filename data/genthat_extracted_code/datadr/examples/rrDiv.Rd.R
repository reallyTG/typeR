library(datadr)


### Name: rrDiv
### Title: Random Replicate Division
### Aliases: rrDiv

### ** Examples

# divide iris data into random subsets with ~20 records per subset
irisRR <- divide(iris, by = rrDiv(20), update = TRUE)
irisRR
# look at the actual distribution of number of rows per subset
plot(splitRowDistn(irisRR))



