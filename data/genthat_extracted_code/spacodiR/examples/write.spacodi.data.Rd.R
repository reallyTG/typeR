library(spacodiR)


### Name: write.spacodi.data
### Title: saving community phylogenetics datasets to a file
### Aliases: write.spacodi.data

### ** Examples

# generate a community-phylogenetics dataset
data(sp.example)
attach(sp.example)

# save the dataset to working directory
write.spacodi.data(sp.plot=spl, outfile="spacodi.formatted.txt")




