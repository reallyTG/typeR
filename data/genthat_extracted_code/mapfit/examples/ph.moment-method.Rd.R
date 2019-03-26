library(mapfit)


### Name: ph.moment
### Title: Moments for Phase-Type (PH) Distribution
### Aliases: ph.mean ph.var ph.moment ph.moment-method
###   ph.moment,ANY,ph-method ph.moment,ANY,herlang-method
### Keywords: distribution

### ** Examples

## create a PH with specific parameters
(param1 <- ph(alpha=c(1,0,0), 
	          Q=rbind(c(-4,2,0),c(2,-5,1),c(1,0,-1)), 
	          xi=c(2,2,0)))

## create a CF1 with specific parameters
(param2 <- cf1(alpha=c(1,0,0), rate=c(1.0,2.0,3.0)))

## create a hyper Erlang with specific parameters
(param3 <- herlang(shape=c(2,3), mixrate=c(0.3,0.7),
	               rate=c(1.0,10.0)))

## mean
ph.mean(param1)
ph.mean(param2)
ph.mean(param3)

## variance
ph.var(param1)
ph.var(param2)
ph.var(param3)

## up to 5 moments 
ph.moment(5, param1)
ph.moment(5, param2)
ph.moment(5, param3)




