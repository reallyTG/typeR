library(MHTdiscrete)


### Name: getPval
### Title: Calculating p-values for discrete data
### Aliases: getPval

### ** Examples

 ## Using Fisher's Exact Test to get the avaiable and attainablep-values
 # import raw data set as data.frame type
 df <-  data.frame(X1=c(4, 2, 2, 13, 6, 8, 4, 0, 1), N1 = rep(148, 9),
 	X2 = c(0, 0, 1, 3, 2, 1, 2, 2, 2), N2 = rep(132, 9))
 # obtain the avaiable p-values and attainable p-values using two-sided Fisher's Exact Test
 getPval(raw.data=df, test.type = "FET",alternative = "two.sided")
 # store the avaiable p-values
p <- getPval(raw.data=df, test.type = "FET",alternative = "two.sided")[[1]]; p
 # store the attainable p-values
p.set <- getPval(raw.data=df, test.type = "FET",alternative = "two.sided")[[2]]; p.set



