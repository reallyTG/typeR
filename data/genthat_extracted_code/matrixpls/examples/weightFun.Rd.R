library(matrixpls)


### Name: weightFun
### Title: Indicator weigth algoritms
### Aliases: weightFun weightFun.pls weightFun.optim weightFun.fixed
###   weightFun.factor weightFun.principal

### ** Examples

library(plspm)

# Run the customer satisfaction examle form plspm

# load dataset satisfaction
data(satisfaction)
# inner model matrix
IMAG = c(0,0,0,0,0,0)
EXPE = c(1,0,0,0,0,0)
QUAL = c(0,1,0,0,0,0)
VAL = c(0,1,1,0,0,0)
SAT = c(1,1,1,1,0,0)
LOY = c(1,0,0,0,1,0)
inner = rbind(IMAG, EXPE, QUAL, VAL, SAT, LOY)
colnames(inner) <- rownames(inner)

# Reflective model
list(1:5, 6:10, 11:15, 16:19, 20:23, 24:27)

reflective<- matrix(
  c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1),
  27,6, dimnames = list(colnames(satisfaction)[1:27],colnames(inner)))

# empty formative model

formative <- matrix(0, 6, 27, dimnames = list(colnames(inner), colnames(satisfaction)[1:27]))

# Estimation using covariance matrix
model <- list(inner = inner,
              reflective = reflective,
              formative = formative)

S <- cov(satisfaction[,1:27])

matrixpls.ModeA <- matrixpls(S, model)
matrixpls.ModeB <- matrixpls(S, model, outerEstim = outerEstim.modeB)
matrixpls.MaxR2 <- matrixpls(S, model, weightFun = weightFun.optim)

# Compare the R2s from the different estimations

R2s <- cbind(r2(matrixpls.ModeA), r2(matrixpls.ModeB), r2(matrixpls.MaxR2))
print(R2s)
apply(R2s,2,mean)

# Optimization against custom function

maximizeSumOfCorrelations <- function(matrixpls.res){
  C <- attr(matrixpls.res,"C")
  model <- attr(matrixpls.res,"model")
  - sum(C[model$inner != 0])
}

matrixpls.MaxCor <- matrixpls(S, model, weightFun = weightFun.optim,
                             optimCrit = maximizeSumOfCorrelations)

# Compare the Mode B and optimized solutions

C <- attr(matrixpls.ModeB,"C")
print(C)
print(sum(C[inner != 0]))
C <- attr(matrixpls.MaxCor,"C")
print(C)
print(sum(C[inner != 0]))



