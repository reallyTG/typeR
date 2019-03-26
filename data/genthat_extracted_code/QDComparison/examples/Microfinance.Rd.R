library(QDComparison)


### Name: Microfinance
### Title: Informal Borrowing in Neighborhoods of Hyderabad, India
### Aliases: Microfinance
### Keywords: datasets

### ** Examples

data(Microfinance)
## maybe str(Microfinance)
y <- Microfinance[,2]
x <- Microfinance[,1]
# Remove the 0s (as Banerjee (2015) appears to have done)
ind <- which(y==0)
x <- x[-ind]
y <- y[-ind]
hist(y[x==0])



