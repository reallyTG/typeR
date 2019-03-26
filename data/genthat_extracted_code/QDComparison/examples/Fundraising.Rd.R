library(QDComparison)


### Name: Fundraising
### Title: Gneezy's Fundraising Data with a Gift Wage
### Aliases: Fundraising
### Keywords: datasets

### ** Examples

data(Fundraising)
## maybe str(Fundraising)
y <- Fundraising[,2]
x <- Fundraising[,1]
hist(y[x==1])



