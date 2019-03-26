library(RZooRoH)


### Name: zoomodel
### Title: Define the model for the RZooRoH
### Aliases: zoomodel

### ** Examples


# To define a the default model, with 10 classes (9 HBD and 1 non-HBD class)
# and with pre-defined rates for HBD classes with a base of 2 (2, 4, 8, ...):

mix10R <- zoomodel()

# To see the parameters of the defined model, just type:

mix10R

# To define a model with pre-defined rates for 5 classes (4 HBD and 1 non-HBD
# class) and using a base of 10 to define rates (10, 100, 1000, ...):

mix5R <- zoomodel(K=5,base=10)

# To define a model with two classes, with estimation of rates for HBD classes
# and starting with a rate 10:

my.mod1R <- zoomodel(predefined=FALSE,K=2,krates=c(10,10))

# To define a model with four classes, with estimation of rates for HBD classes
# and choosing four initial rates:

my.mod4R <- zoomodel(predefined=FALSE,K=4,krates=c(16,64,256,256))





