library(schoRsch)


### Name: zscores
### Title: Compute z-Scores by Condition
### Aliases: zscores
### Keywords: utilities

### ** Examples

# Create input vector and compute z-scores
measurements <- c(3,12,5,4,2,23,1,6)
zscores(measurements)

# Compute z-scores separately
# for conditions
cond1 <- c(1,1,1,1,2,2,2,2)
cond2 <- c(1,1,2,2,1,1,2,2)
zscores(measurements,list(cond1))
zscores(measurements,list(cond1,cond2))

# Calling zscores for data frames
data <- data.frame(measurements,
	cond1,cond2)
zscores(data,dv="measurements",
	factors=c("cond1","cond2"))
	
# Operating on column indices
zscores(data,dv=1,
	factors=3)




