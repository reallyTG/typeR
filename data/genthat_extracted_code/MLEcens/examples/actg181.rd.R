library(MLEcens)


### Name: actg181
### Title: Data from the Aids Clinical Trials Group protocol ACTG 181
### Aliases: actg181
### Keywords: datasets

### ** Examples

# Load the data
data(actg181)

# Compute the MLE
mle <- computeMLE(R=actg181, B=c(1,1,1,1))

# Create CDF plots of the MLE: 
# (Maximal intersections are denoted in red)
par(mfrow=c(2,2))

# Lower bound for bivariate CDF
plotCDF2(mle, bound="l", xlim=c(-1,101), ylim=c(-1,101),
 n.key=5, main="Bivariate CDF (lower bound)", 
 xlab="time to CMV shedding (months)", 
 ylab="time to MAC colonization (months)")
plotRects(mle$rects, border="red", add=TRUE)

# Upper bound for bivariate CDF
plotCDF2(mle, bound="u", xlim=c(-1,101), ylim=c(-1,101),
 n.key=5, main="Bivariate CDF (upper bound)", 
 xlab="time to CMV shedding (months)", 
 ylab="time to MAC colonization (months)")
plotRects(mle$rects, border="red", add=TRUE)

# Marginal CDF for X
plotCDF1(mle, margin=1, xlim=c(0,90), 
 main="CDF for time to CMV shedding",   
 xlab="t (months)", ylab="P(time to CMV shedding <= t)")

# Marginal CDF for Y
plotCDF1(mle, margin=2, xlim=c(0,90), 
 main="CDF for time to MAC colonization", 
 xlab="t (months)",  ylab="P(time to MAC colonization <= t)")

# Note that the difference between the upper and lower bound 
# of the MLE (because of representational non-uniqueness)
# is large, especially for the time to MAC colonization. 



