library(BoolNet)


### Name: loadBioTapestry
### Title: Import a network from BioTapestry
### Aliases: loadBioTapestry
### Keywords: BioTapestry import

### ** Examples

# import the example BioTapestry file
# included in the package vignette
exampleFile <- system.file("doc/example.btp",
                           package="BoolNet")
net <- loadBioTapestry(exampleFile)

# print the imported network
print(net)



