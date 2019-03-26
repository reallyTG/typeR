library(mcompanion)


### Name: mCompanion
### Title: Create objects from class MultiCompanion
### Aliases: mCompanion initialize,MultiCompanion-method
### Keywords: matrices

### ** Examples

# simulate a 6x6 mc matrix with 4 non-trivial rows
mCompanion("sim", dim = 4, mo = 2)
mCompanion("sim", dim = 6, mo = 4)
# similar to above but top rows with 2 non-zero columns
mCompanion("sim", dim = 6, mo = 4, mo.col = 2)

m1 <- matrix(1:24, nrow = 4)
mCompanion(m1)            # mc matrix with m1 on top

m2 <- rbind(c(1, 2, 0, 0), c(3, 4, 0, 0))
x2a <- mCompanion(m2)     # mc matrix with m2 on top
x2a@mo.col                #  = 4

x2 <- mCompanion(m2, mo.col = "detect")
x2@mo.col                #  = 2,  detects the 0 columns in m2
mCompanion(m2, mo.col = 2)  # same

# create manually an mc matrix
(m3 <- rbind(m1, c(1, rep(0, 5)), c(0, 1, rep(0, 4))))
# turn it into a MultiCompanion object
x3 <- mCompanion(x = m3, detect = "mo")
x3@mo
x3 <- mCompanion(m3)
x3@mo

m4 <- rbind(c(1, 2, rep(0, 4)), c(3, 4, rep(0, 4)))

x4 <- mCompanion(m4, mo = 2)
x4@mo.col    #  = 6,
## special structure not incorporated in x4,
##   eigen and mc_eigen are equiv. in this case
eigen(x4)
mc_eigen(x4)

x4a <- mCompanion(m4, mo = 2, mo.col = 2)
x4a@mo.col    #  = 2,  has Jordan blocks of size > 1
## the eigenvectors do not span the space:
eigen(x4a)
## mc_eigen exploits the Jordan structure ((e.g.2x2 Jordan blocks):
(ev <- mc_eigen(x4a))

x4a %*% ev$vectors

## construct the Jordan matrix of x4a from eigenvalues and eigenvectors
(x4a.j <- Jordan_matrix(ev$values,  ev$len.block))

## check that AX = XJ and A = XJX^-1, up to numerical precision:
x4a %*% ev$vectors  -  ev$vectors %*% x4a.j
x4a  -  ev$vectors %*% x4a.j %*% solve(ev$vectors)



