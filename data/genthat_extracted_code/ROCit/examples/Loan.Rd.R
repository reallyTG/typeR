library(ROCit)


### Name: Loan
### Title: Loan Data
### Aliases: Loan
### Keywords: datasets

### ** Examples

data("Loan")
boxplot(Income~Home, data = Loan, col = c(2:4), pch = 16,
        ylim = c(0,200000), ylab = "Income",
        xlab = "Home Ownership Status",
        main = "Annual Income Boxplot")
grid()




