library(funData)


### Name: scalarProduct
### Title: Calculate the scalar product for functional data objects
### Aliases: scalarProduct

### ** Examples

# create two funData objectw with 5 observations on [0,1]
f <- simFunData(N = 5, M = 7, eValType = "linear",
                eFunType = "Fourier", argvals = seq(0,1,0.01))$simData
g <- simFunData(N = 5, M = 4, eValType = "linear",
                eFunType = "Poly", argvals = seq(0,1,0.01))$simData
                
# calculate the scalar product
scalarProduct(f,g)

# the scalar product of an object with itself equals the squared norm
all.equal(scalarProduct(f,f), norm(f, squared = TRUE))

# This works of course also for multiFunData objects...
m <- multiFunData(f,g)
all.equal(scalarProduct(m,m), norm(m, squared = TRUE))

# ...and for irregFunData objects
i <- as.irregFunData(sparsify(f, minObs = 5, maxObs = 10))
all.equal(scalarProduct(i,i), norm(i, squared = TRUE))

# Scalar product between funData and irregFunData objects
scalarProduct(i,f)

# Weighted scalar product for multiFunData objects
scalarProduct(m,m, weight = c(1,2))



