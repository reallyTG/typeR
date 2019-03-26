library(autoencoder)


### Name: autoencoder_Ninput=100_Nhidden=25_rho=1e-2
### Title: A trained autoencoder example with 25 hidden units
### Aliases: autoencoder.object.1
### Keywords: datasets

### ** Examples

## Load a pre-trained autoencoder object with N.input=100 and N.hidden=5*5,
## trained on unlabeled set of 5000 image patches of size Nx.patch by Ny.patch, 
## randomly picked from 10 nature photos, and visualize the features 
## learned by its hidden units:

data('autoencoder_Ninput=100_Nhidden=25_rho=1e-2')

## Visualize hidden units' learned features:
visualize.hidden.units(autoencoder.object,Nx.patch=10,Ny.patch=10)



