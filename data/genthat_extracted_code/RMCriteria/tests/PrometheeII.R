library(RMCriteria)
dados<-matrix(c(5.2, -3.5,
                4.3, -1.2,
                6.7, -2.0), byrow = TRUE, ncol = 2, nrow = 3)

colnames(dados)<-c("Criteria 1","Criteria 2")
rownames(dados)<-c("Alternative 1", "Alternative 2", "Alternative 3")

parms <- matrix(c(NA, NA), byrow = TRUE, ncol = 1, nrow = 2)

#RMCriteria::PrometheeII(dados,c(0.3,0.7),c(0,0),parms,FALSE)

#Step 1: Construct the RPrometheeArguments
PromObj <- RPrometheeConstructor(datMat = dados, vecWeights = c(0.3, 0.7), vecMaximiz= c(FALSE, TRUE), prefFunction = c(0, 0), parms = parms, normalize = FALSE)
result <- RPrometheeII(PromObj)
summary(result)
print(result)
show(result)
str(result)

PrometheeIIPlot(result)
WalkingWeightsPlot(result)
plot(result)

alt <- c("A", "B", "C")

result <- UpdateRPrometheeAlternatives(result, alt)
