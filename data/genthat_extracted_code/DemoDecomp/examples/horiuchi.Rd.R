library(DemoDecomp)


### Name: horiuchi
### Title: Numeric Approximation of Continuous Decomposition
### Aliases: horiuchi

### ** Examples


data(rates1)
data(rates2)

# we need rates1 and rates2 as vectors
rates1 <- c(rates1)
rates2 <- c(rates2)
# look at the function:
R0vec
# 2 things to point out:
# 1) it has an argument pfem, proportion female of births (1/(1+SRB)), 
#    that must be specified, but that we don't care about decomposing
# 2) x is a single vector. The the inside of the function needs to 
#    either refer to parts of it by indexing, as done here, or else 
#    re-assign x to various objects. In this case x[1:l] is Lx and 
#    x[(l+1):(2*l)] is Fx...
A <- horiuchi(func = R0vec,
              pars1 = rates1,
              pars2 = rates2,
              N = 10,
              pfem = .4886)
# the output, A, is also a single vector. Each element corresponds 
# to the effect of changes in that particular covariate toward the 
# overall change in the function value. sum(A) should be close to
# original difference
(check1 <- R0vec(rates2) - R0vec(rates1)) 
(check2 <- sum(A))

## Don't show: 
# de facto unit test. In this case the residual is very tiny,
# but if differences are very large and there are very many components,
# then the residual can be larger albeit trivial. In that case
# increase N and go make a coffee.
stopifnot(abs(check1 - check2) < 1e-6)
## End(Don't show)

# This package does not supply default plotting functions, but one 
# strategy might be the following:

# reorder A into a matrix (sideways):
A <- t(matrix(A,ncol=2))
# call barplot() twice, once for positive values and again for
# negative values
Apos <- A * .5 * (sign(A) + 1)      
Aneg <- A * .5 * abs(sign(A) - 1)   
## Not run: 
##D barplot(Apos, 
##D         width = rep(1, length(A) / 2),
##D         space = 0, 
##D         ylim = range(A), 
##D         main = "A fake decomposition of R0",
##D         col=c("yellow","green"),
##D         axisnames = FALSE,
##D         xlim=c(0, 90), 
##D         ylab = "contrib to change in R0",
##D         cex.axis = .7)
##D barplot(Aneg, 
##D         width = rep(1, length(A) / 2),
##D         add = TRUE, 
##D         space = 0,
##D         col = c("yellow", "green"),
##D         axes = FALSE, axisnames = FALSE)
##D segments(seq(from=0,to=90,by=10),0,seq(from=0,to=90,by=10),-.027,lty=2,col="grey")
##D text(seq(from=0,to=90,by=10),-.027,seq(from=0,to=90,by=10),pos=1,xpd=T)
##D legend("bottomright",fill=c("yellow","green"),legend=c("contrib from change in Lx",
##D "contrib from change in Fx"),title="age specific contrib of changes in Fx and Lx",bg="white") 
## End(Not run)




