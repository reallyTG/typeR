# HEADER ####################################################
# This is file spam/tests/demo_cholesky.R.                  #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################


# We illustrate the Cholesky decompostion approaches
options( echo=FALSE)
library( spam, warn.conflict=FALSE)

set.seed(14)




# first start with a full matrix.
xn <- 50
fmat1 <- matrix(rnorm(xn*xn),xn,xn)
fmat1 <- t( fmat1) %*% fmat1
smat1 <- as.spam(fmat1)
smat2 <- smat1 + diag.spam(xn)

# Generic Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( fmat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, reusing pivoting
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1,pivot=ch1@pivot)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, updating
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- update.spam.chol.NgPeyton( ch1, smat2)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# reset to default
options(spam.cholsymmetrycheck=TRUE)




# now create a sparse matrix.
fmat1[fmat1<3] <- 0
smat1 <- as.spam(fmat1)
smat2 <- smat1 + diag.spam(xn)

# Generic Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( fmat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, reusing pivoting
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1,pivot=ch1@pivot)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, updating
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- update.spam.chol.NgPeyton( ch1, smat2)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# reset to default
options(spam.cholsymmetrycheck=TRUE)



# now create an even sparser matrix.
fmat1 <- fmat1+20*diag(xn)
fmat1[fmat1<32] <- 0
smat1 <- as.spam(fmat1)
smat2 <- smat1 + 1* diag.spam(xn)


# Generic Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( fmat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, direct call
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)

# Sparse Cholesky, without symmetry check
options(spam.cholsymmetrycheck=FALSE)
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, reusing pivoting
options(spam.cholsymmetrycheck=FALSE)
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- chol.spam( smat1,pivot=ch1@pivot)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# Sparse Cholesky, updating
options(spam.cholsymmetrycheck=FALSE)
# tmp <- gc(F);Rprof(memory.profiling=TRUE, interval = 0.01)
ch1 <- update.spam.chol.NgPeyton( ch1, smat2)
# Rprof(NULL);print( summaryRprof(memory="both")$by.total)


# reset to default
options(spam.cholsymmetrycheck=TRUE)


options( echo=TRUE)
