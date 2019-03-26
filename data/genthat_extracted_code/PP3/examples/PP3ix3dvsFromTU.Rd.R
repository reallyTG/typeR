library(PP3)


### Name: PP3ix3dvsFromTU
### Title: Compute the projection index or its derivatives from the T and U
###   statistics.
### Aliases: PP3ix3dvsFromTU PP3ix3FromTU
### Keywords: multivariate

### ** Examples

#
# Not for direct user use, but here is an example
#
#
# Load flea beetle data
#
data(beetle)
#
# Initialize T and U tensors
#
b.init <- PP3init(t(beetle))
#
# Get number of cases and dimensions
#
b.n <- nrow(beetle)
b.k <- ncol(beetle)
fortran.messages <- 0
#
# Select arbitrary projection vectors
#
b.pva <- c(1, rep(0, b.k-1))
b.pvb <- c(0, 1, rep(0, b.k-2))
b.pvc <- c(0, 0, 1, rep(0, b.k-3))
#
# Now compute the projection index for this data for this direction
#
answer <- PP3ix3FromTU(the.init=b.init, avec=b.pva, bvec=b.pvb,
	cvec=b.pvc, maxrow=b.k, k=b.k, maxcol=b.n, n=b.n,
	text=fortran.messages)
#
# Print out answer
#
answer
# [1] 13.49793
#
# Now compute the projection index derivatives for this data for this 
# direction
#
answer <- PP3ix3dvsFromTU(the.init=b.init, avec=b.pva, bvec=b.pvb,
	cvec=b.pvc, maxrow=b.k, k=b.k, maxcol=b.n, n=b.n,
	text=fortran.messages, type="deriv")
#
# Print out answer
#
answer
# [1]  0.000000e+00  0.000000e+00  0.000000e+00 -1.283695e-15  0.000000e+00
# [6]  0.000000e+00  0.000000e+00 -4.649059e-16  0.000000e+00  2.910680e+00
#[11] -4.941646e+00 -1.232917e+00  1.057721e-01 -4.608611e+00 -8.286708e-01
#[16] -1.602697e-01  1.724654e+00 -2.029220e+00
#
# The answer is a vector of length 3xb.k = 18. The first b.k=6 entries
# correspond to the derivative wrt b.pva, the next b.k=6 entries to
# b.pvb, and the last b.k=6 entries to b.pvc.



