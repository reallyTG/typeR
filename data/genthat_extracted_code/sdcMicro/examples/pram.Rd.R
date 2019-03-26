library(sdcMicro)


### Name: pram
### Title: Post Randomization
### Aliases: pram
### Keywords: manip

### ** Examples

data(testdata)

## application on a factor-variable
res <- pram(as.factor(testdata$roof))
print(res)
summary(res)

## application on a data.frame
## pram can only be applied to factors, thus we have to recode
## to factors before the method can be applied
testdata$roof <- factor(testdata$roof)
testdata$walls <- factor(testdata$walls)
testdata$water <- factor(testdata$water)

## pram() is applied within subgroups defined by
## variables "urbrur" and "sex"
res <- pram(testdata, variables="roof",
  strata_variables=c("urbrur","sex"))
print(res)
summary(res)

## default parameters (pd=0.8 and alpha=0.5) for the generation
## of the invariant transition matrix will be used for all variables
res1 <- pram(testdata, variables=c("roof","walls","water"))
print(res1)

## specific parameters for each variable
res2 <- pram(testdata,variables=c("roof","walls","water"),
  pd=c(0.95,0.8,0.9), alpha=0.5)
print(res2)

## detailed information on pram-parameters (such as the transition matrix 'Rs')
## is stored in the output, eg. for variable 'roof'
attr(res2, "pram_params")$roof

## we can also specify a custom transition-matrix directly
# for variable roof; matrix must have rownames and colnames that match
# the levels of the variable that should be post-randomized
# rowSums() and colSums() must equal 1 too!
mat <- diag(length(levels(testdata$roof)))
rownames(mat) <- colnames(mat) <- levels(testdata$roof)
res3 <- pram(testdata,variables="roof", pd=mat)
print(res3) # of course, nothing has changed!

## it is possible use a transistion matrix for a variable and use the 'traditional' way
## of specifying a number for the minimal diagonal entries of the transision matrix
## for other variables. In this case we must supply \code{pd} as list.
res4 <- pram(testdata,variables=c("roof","walls"), pd=list(mat,0.5), alpha=c(NA, 0.5))
print(res4)
summary(res4)
attr(res4, "pram_params")

## application to objects of class sdcMicro with default parameters
data(testdata2)
testdata2$urbrur <- factor(testdata2$urbrur)
sdc <- createSdcObj(testdata2,
  keyVars=c('roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- pram(sdc, variables=c("urbrur"))
print(sdc, type="pram")

## this is equal to the previous application. If argument 'variables' is NULL,
## all variables from slot 'pramVars' will be used if possible.
sdc <- createSdcObj(testdata2,
  keyVars=c('roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight',
  pramVars="urbrur")
sdc <- pram(sdc)
print(sdc, type="pram")

## we can specify transition matrices for sdcMicroObj-objects too
testdata2$roof <- factor(testdata2$roof)
sdc <- createSdcObj(testdata2,
  keyVars=c('roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
mat <- diag(length(levels(testdata2$roof)))
rownames(mat) <- colnames(mat) <- levels(testdata2$roof)
mat[1,] <- c(0.9,0,0,0.05,0.05)
sdc <- pram(sdc, variables="roof", pd=mat)
print(sdc, type="pram")
# we can also have a look at the transitions
get.sdcMicroObj(sdc, "pram")$transitions



