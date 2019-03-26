library(FinAsym)


### Name: classify_quotes
### Title: Classification of implicit trade origination from market quotes
### Aliases: classify_quotes
### Keywords: classify_quotes

### ** Examples

#Sample data
mydata<-matrix(c(4.56, 4.7, 4.57, 4.64, 4.53, 
4.65, 4.59, 4.66, 4.55, 4.65, 4.59, 4.66, 4.59, 
4.66, 4.55, 4.65, 4.55, 4.65, 4.55, 4.65, 4.59, 
4.66, 4.55, 4.65, 4.59, 4.66, 4.59, 4.66), 
nrow=14, byrow=TRUE)

#Trading day
gname <- 'June 29 2006'
	
ind_bid <- c(1)
ind_ask <- c(2)
	
quotes_types <- classify_quotes(mydata, ind_bid, 
ind_ask, gname)



