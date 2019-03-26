library(RMCriteria)
dados<-matrix(c(5.2, -3.5,
                4.3, -1.2,
                6.7, -2.0), byrow = TRUE, ncol = 2, nrow = 3)

# dados<-matrix(c(5.2,-3.5,
#                 4.3,-1.2,
#                 6.7,-2.0,
#                 5.1,-8.3,
#                 1.8, 0.0,
#                 9.7,-4.9,
#                 10.8,-1),byrow = T, ncol=2)

parms<-matrix(c(1.0,
                1.3), byrow = TRUE, ncol = 1, nrow = 2)

PromObj <- RPrometheeConstructor(datMat = dados, vecWeights = c(0.5, 0.5), vecMaximiz = c(FALSE, TRUE), prefFunction = c(0, 0), parms = parms, normalize = FALSE)
res <- RPrometheeIV(PromObj)
summary(res)
print(res)
show(res)
str(res)
PrometheeIVPlot(res)
