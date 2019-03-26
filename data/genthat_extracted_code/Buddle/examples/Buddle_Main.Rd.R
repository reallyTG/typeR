library(Buddle)


### Name: Buddle_Main
### Title: Building a multi-layer feed-forward neural network model for
###   statistical classification
### Aliases: Buddle_Main

### ** Examples

####################
n <- 50
p <- 3
Data <- matrix(runif(n*p, 0,50), nrow=n, ncol=p)  #### Generate n-by-p input matrix for data
Label = sample.int(n, n, replace=TRUE)            #### Generate n-by-1 vector for the label
Layer = 6                                      #### Number of layers
Neuron = 20                                    #### Number of neurons
lr = 0.005                                     #### Learning rate 
Iter = 100                                #### Iteration
Opt = "SGD"                              #### Method to optimize the loss function
Act = "Sigmoid"                          ##### Activation function
TrSize = 20                              ##### Train_Size
BatSize = 5                               ##### Batch_Size
DLResult = Buddle_Main(Data, Label, TrSize, BatSize, Opt, lr, Iter, Layer, Neuron, Act)
Loss_Vector = DLResult$Loss
Train_Accuracy = DLResult$Train_acc
Test_Accuracy = DLResult$Test_acc



