library(RMCriteria)
dados <- matrix(c(5.2, -3.5,
                4.3, -1.2,
                6.7, -2.0), byrow = TRUE, ncol = 2, nrow = 3)

bands <- as.matrix(apply(dados, 2, bw.nrd0))

parms <- matrix(c(1.0,
                  1.3), byrow = TRUE, ncol = 1, nrow = 2)

#Step 1: Construct the RPrometheeArguments
PromObj <- RPrometheeConstructor(datMat = dados, vecWeights = c(0.3, 0.7), vecMaximiz = c(TRUE, TRUE), prefFunction = c(1, 1), parms = parms, band = bands, normalize = FALSE)
res <- RPrometheeIVKernel(PromObj)
summary(res)
print(res)
show(res)
str(res)
