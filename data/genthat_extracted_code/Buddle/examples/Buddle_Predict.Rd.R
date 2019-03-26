library(Buddle)


### Name: Buddle_Predict
### Title: Making a prediction based on the traind network model obtained
###   from Buddle_Main()
### Aliases: Buddle_Predict

### ** Examples

n = 50
p = 3
Data = matrix(runif(n*p, 0,50), nrow=n, ncol=p)  #### Generate n-by-p input matrix for data
Label = sample.int(n, n, replace=TRUE)            #### Generate n-by-1 vector for the label
DLResult = Buddle_Main(Data, Label, 20, 5, "SGD", 0.01, 100, 6, 20, "Sigmoid")

xVec=rep(0, times=p)
Index = Buddle_Predict(DLResult, xVec)        ###### Predict for given xVec




