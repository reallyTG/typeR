library(rspa)


### Name: match_restrictions
### Title: Alter numeric data records to match linear (in)equality
###   constraints.
### Aliases: match_restrictions

### ** Examples


# a very simple adjustment example

v <- validate::validator(
	x + y == 10,
	x > 0,
	y > 0
)

# x and y will be adjusted by the same amount
match_restrictions(data.frame(x=4,y=5), v)

# One of the inequalies violated
match_restrictions(data.frame(x=-1,y=5), v)

# Weighted distances: 'heavy' variables change less
match_restrictions(data.frame(x=4,y=5), v, weight=c(100,1))

# if w=1/x0, the ratio between coefficients of x0 stay the same (to first order)
x0 <- data.frame(x=4,y=5)
x1 <- match_restrictions(x0, v, weight=1/as.matrix(x0))

x0[,1]/x0[,2]
x1[,1] / x1[2]

# example of tag usage
v <- validate::validator(x + y == 1, x>0,y>0)
d <- data.frame(x=NA,y=0.5)
d <- tag_missing(d)
# impute
d[1,1] <- 1

# only the tagged values will be altered. The tag is
# removed afterwards.
match_restrictions(d,v)





