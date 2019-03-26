library(SpectralMap)


### Name: SpectralMap
### Title: Diffusion Map and Spectral Map
### Aliases: SpectralMap

### ** Examples

#generate two datasets
n <- 100
theta <- 2*pi*seq(from=0, to=1-1/n, by=1/n)
r = (1 + cos(6*theta)/4)

# X is a circle
X1 = cos(theta)
X2 = sin(theta)
X<-data.frame(X1,X2)

#Y is a hexagon
Y1 = r*cos(theta)
Y2 = r*sin(theta)
Y<-data.frame(Y1,Y2)

#create data list
Data<-list(X,Y)

#create the diffusion map of X
example1<-SpectralMap(Data, epsilon=0.1, range=1, Plot2D=TRUE, Plot3D=FALSE)
#create the spectral map from X to Y
example2<-SpectralMap(Data, epsilon=0.1, range=1:2, Plot2D=TRUE, Plot3D=FALSE)



