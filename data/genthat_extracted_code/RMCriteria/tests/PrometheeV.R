library(RMCriteria)
dados<-matrix(c(5.2,  -3.5,
                4.3,  -1.2,
                6.7,  -2.0,
                5.4,  -5.0,
                4.8,   0.0,
                2.8, -15.0), byrow = TRUE, ncol = 2)

parms<-matrix(c(1.0,
                5.0), byrow = TRUE, ncol = 1, nrow = 2)

constraintDir <- rep("<=", ncol(dados))

# datMat<-dados
vecWeights <- c(0.3, 0.7)
prefFunction <- c(0, 0)
bounds <- c(4, -1)
normalize <- FALSE


PromObj <- RPrometheeConstructor(datMat = dados,vecWeights = vecWeights, vecMaximiz = c(FALSE, TRUE), prefFunction = c(0, 0), constraintDir = constraintDir, bounds = bounds, parms = parms, normalize = FALSE)

res <- RPrometheeV(PromObj, method = "RPrometheeII")
RPrometheeV(PromObj, method = "RPrometheeIV")
RPrometheeV(PromObj)

summary(res)
print(res)
show(res)
str(res)

