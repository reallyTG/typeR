library(OpenMx)


### Name: mxRowObjective
### Title: DEPRECATED: Create MxRowObjective Object
### Aliases: mxRowObjective

### ** Examples

# Model that adds two data columns row-wise, then sums that column
# Notice no optimization is performed here.

library(OpenMx)

xdat <- data.frame(a=rnorm(10), b=1:10) # Make data set
amod <- mxModel(model="example1",
            mxData(observed=xdat, type='raw'),
            mxAlgebra(sum(filteredDataRow), name = 'rowAlgebra'),
            mxAlgebra(sum(rowResults), name = 'reduceAlgebra'),
            mxFitFunctionRow(
                rowAlgebra='rowAlgebra',
                reduceAlgebra='reduceAlgebra',
                dimnames=c('a','b'))
)
amodOut <- mxRun(amod)
mxEval(rowResults, model=amodOut)
mxEval(reduceAlgebra, model=amodOut)

# Model that find the parameter that minimizes the sum of the
#  squared difference between the parameter and a data row.

bmod <- mxModel(model="example2",
            mxData(observed=xdat, type='raw'),
            mxMatrix(values=.75, ncol=1, nrow=1, free=TRUE, name='B'),
            mxAlgebra((filteredDataRow - B) ^ 2, name='rowAlgebra'),
            mxAlgebra(sum(rowResults), name='reduceAlgebra'),
            mxFitFunctionRow(
                rowAlgebra='rowAlgebra',
                reduceAlgebra='reduceAlgebra',
                dimnames=c('a'))
)
bmodOut <- mxRun(bmod)
mxEval(B, model=bmodOut)
mxEval(reduceAlgebra, model=bmodOut)
mxEval(rowResults, model=bmodOut)



