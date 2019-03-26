library(autoencoder)


### Name: training_matrix_N=5e3_Ninput=100
### Title: An example training set of images for training sparse
###   autoencoder
### Aliases: training.matrix
### Keywords: datasets

### ** Examples

data('training_matrix_N=5e3_Ninput=100') ## load the example training.matrix

## Set up the autoencoder architecture:
nl=3                          ## number of layers (default is 3: input, hidden, output)
unit.type = "logistic"        ## specify the network unit type, i.e., the unit's 
                              ## activation function ("logistic" or "tanh")
Nx.patch=10                   ## width of training image patches, in pixels
Ny.patch=10                   ## height of training image patches, in pixels
N.input = Nx.patch*Ny.patch   ## number of units (neurons) in the input layer (one unit per pixel)
N.hidden = 10*10              ## number of units in the hidden layer
lambda = 0.0002               ## weight decay parameter     
beta = 6                      ## weight of sparsity penalty term 
rho = 0.01                    ## desired sparsity parameter
epsilon <- 0.001              ## a small parameter for initialization of weights 
                              ## as small gaussian random numbers sampled from N(0,epsilon^2)
max.iterations = 2000         ## number of iterations in optimizer

## Train the autoencoder on training.matrix using BFGS optimization method 
## (see help('optim') for details):

## Not run: 
##D autoencoder.object <- autoencode(X.train=training.matrix,nl=nl,N.hidden=N.hidden,
##D           unit.type=unit.type,lambda=lambda,beta=beta,rho=rho,epsilon=epsilon,
##D           optim.method="BFGS",max.iterations=max.iterations,
##D           rescale.flag=TRUE,rescaling.offset=0.001)
##D           
## End(Not run)
## Don't show: 
data('autoencoder_Ninput=100_Nhidden=100_rho=1e-2')
## End(Don't show)
          
## Extract weights W and biases b from autoencoder.object:
W <- autoencoder.object$W
b <- autoencoder.object$b
## Visualize learned features of the autoencoder:
visualize.hidden.units(autoencoder.object,Nx.patch,Ny.patch)



