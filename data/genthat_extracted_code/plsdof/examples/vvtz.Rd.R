library(plsdof)


### Name: vvtz
### Title: Projectin operator
### Aliases: vvtz
### Keywords: math

### ** Examples

# generate random orthogonal vectors
X<-matrix(rnorm(10*100),ncol=10) 	# random data
S<-cor(X) 				# correlation matrix of data
v<-eigen(S)$vectors[,1:3]		# first three eigenvectors of correlation matrix
z<-rnorm(10)				# random vector z
projection.z<-vvtz(v,z)




