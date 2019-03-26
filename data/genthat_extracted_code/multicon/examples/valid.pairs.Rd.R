library(multicon)


### Name: valid.pairs
### Title: Valid Pairs
### Aliases: valid.pairs
### Keywords: valid pairs missing data

### ** Examples

	# Making some data
x.vect <- rnorm(100, m=0, sd=.5)
y.vect <- rnorm(100, m=0, sd=.5)
	#checking valid pairs
valid.pairs(x.vect,y.vect) 
	#making some missing data
x.vect[1:5] <- NA
y.vect[95:100] <- NA
	#now checking valid pairs 
valid.pairs(x.vect,y.vect) 



