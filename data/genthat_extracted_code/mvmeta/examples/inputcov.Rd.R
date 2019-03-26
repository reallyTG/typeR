library(mvmeta)


### Name: inputcov
### Title: Input (Co)Variance Matrices
### Aliases: inputcov
### Keywords: manip

### ** Examples

# SOME RANDOM SD FOR A SINGLE MATRIX, WITH CONSTANT CORRELATION
(M <- inputcov(runif(4,0.1,3),0.7))
# CHECK CORRELATION
cov2cor(M)

# NOW WITH A MORE COMPLEX CORRELATION STRUCTURE
(M <- inputcov(runif(3,0.1,3),c(0.7,0.2,0.4)))
cov2cor(M)

# MULTIPLE MATRICES
(V <- matrix(runif(5*3,0.1,3),5,3,dimnames=list(1:5,paste("V",1:3,sep=""))))
inputcov(V,0.6)

# WITH REAL DATA WHEN CORRELATIONS AVAILABLE
hyp
(S <- inputcov(hyp[c("sbp_se","dbp_se")],cor=hyp$rho))
# CHECK FIRST STUDY
cov2cor(xpndMat(S[1,]))

# USED INTERNALLY IN mvmeta
p53
inputcov(sqrt(p53[c("V1","V2")]),0.5)
model <- mvmeta(cbind(y1,y2),S=cbind(V1,V2),data=p53,control=list(Scor=0.5))
model$S



