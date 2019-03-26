library(OpenMx)


### Name: mxConstraint
### Title: Create MxConstraint Object
### Aliases: mxConstraint mxConstraintFromString

### ** Examples


library(OpenMx)

#Create a constraint between MxMatrices 'A' and 'B'
constraint <- mxConstraint(A > B, name = 'AdominatesB')

# Constrain matrix 'K' to be equal to matrix 'limit'

model <- mxModel(model="con_test", 
    mxMatrix(type="Full", nrow=2, ncol=2, free=TRUE, name="K"),
    mxMatrix(type="Full", nrow=2, ncol=2, free=FALSE, name="limit", values=1:4),
    mxConstraint(K == limit, name = "Klimit_equality"), 
    mxAlgebra(min(K), name="minK"), 
    mxFitFunctionAlgebra("minK")
)

fit <- mxRun(model)
fit$matrices$K$values

#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4

# Constrain both free parameters of a matrix to equality using labels (both are set to "eq")
equal <- mxMatrix("Full", 2, 1, free=TRUE, values=1, labels="eq", name="D")

# Constrain a matrix element in to be equal to the result of an algebra
start <- mxMatrix("Full", 1, 1, free=TRUE,  values=1, labels="param", name="F")
alg   <- mxAlgebra(log(start), name="logP")

# Force the fixed parameter in matrix G to be the result of the algebra
end   <- mxMatrix("Full", 1, 1, free=FALSE, values=1, labels="logP[1,1]", name="G")




