library(varhandle)


### Name: to.dummy
### Title: Convert categorical vector into dummy binary dataframe
### Aliases: to.dummy
### Keywords: Binary dummy

### ** Examples

    # load a dataframe (from base package)
    data(iris)
    
    # see the actual values of the categorical column
    print(iris$Species)
    
    # convert to dummy
    binary_species <- to.dummy(iris$Species, "species")
    # view the first few lines of the binary_species data.frame
    head(binary_species)



