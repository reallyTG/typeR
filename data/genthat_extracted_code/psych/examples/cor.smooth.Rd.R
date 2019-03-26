library(psych)


### Name: cor.smooth
### Title: Smooth a non-positive definite correlation matrix to make it
###   positive definite
### Aliases: cor.smooth cor.smoother
### Keywords: multivariate models

### ** Examples

bs <- cor.smooth(burt)  #burt data set is not positive definite
plot(burt[lower.tri(burt)],bs[lower.tri(bs)],ylab="smoothed values",xlab="original values")
abline(0,1,lty="dashed")

round(burt - bs,3) 
fa(burt,2) #this throws a warning that the matrix yields an improper solution
#Smoothing first throws a warning that the matrix was improper, 
#but produces a better solution 
fa(cor.smooth(burt),2)  

#this next example is a correlation matrix from DeLeuw used as an example 
#in Knol and ten Berge.  
#the example is also used in the nearcor documentation
 cat("pr is the example matrix used in Knol DL, ten Berge (1989)\n")
 pr <- matrix(c(1,     0.477, 0.644, 0.478, 0.651, 0.826,
		0.477, 1,     0.516, 0.233, 0.682, 0.75,
		0.644, 0.516, 1,     0.599, 0.581, 0.742,
		0.478, 0.233, 0.599, 1,     0.741, 0.8,
		0.651, 0.682, 0.581, 0.741, 1,     0.798,
		0.826, 0.75,  0.742, 0.8,   0.798, 1),
	      nrow = 6, ncol = 6)
	      
sm <- cor.smooth(pr)
resid <- pr - sm
# several goodness of fit tests
# from Knol and ten Berge
tr(resid %*% t(resid)) /2

# from nearPD
sum(resid^2)/2




