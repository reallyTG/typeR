library(autoencoder)


### Name: visualize.hidden.units
### Title: Visualize features learned by a sparse autoencoder
### Aliases: visualize.hidden.units
### Keywords: ~autoencoder ~sparse autoencoder ~features visualization
###   ~deep learning

### ** Examples

## Load a pre-trained autoencoder object with N.input=100 and N.hidden=10*10,
## trained on unlabeled set of 5000 image patches of size 
## Nx.patch=10 by Ny.patch=10 pixels, 
## randomly cropped from 10 nature photos, and visualize the features 
## learned by its hidden units:

data('autoencoder_Ninput=100_Nhidden=100_rho=1e-2')          

## Visualize hidden units' learned features:
visualize.hidden.units(autoencoder.object,Nx.patch=10,Ny.patch=10)



