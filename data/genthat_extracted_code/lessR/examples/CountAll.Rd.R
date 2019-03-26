library(lessR)


### Name: CountAll
### Title: CountAll Descriptive Analysis of all Variables in the Data Frame
### Aliases: CountAll ca
### Keywords: descriptive histogram bar chart

### ** Examples

# create data frame called d
n <- 12
X <- sample(c("Group1","Group2"), size=n, replace=TRUE)
Y <- rnorm(n=n, mean=50, sd=10)
d <- data.frame(X,Y)
rm(X); rm(Y);

# CountAll descriptive analysis of d
CountAll()
# short name
ca()



