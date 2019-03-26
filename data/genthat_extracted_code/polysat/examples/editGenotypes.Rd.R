library(polysat)


### Name: editGenotypes
### Title: Edit Genotypes Using the Data Editor
### Aliases: editGenotypes
### Keywords: manip

### ** Examples

if(interactive()){  #this line included for automated checking on CRAN

# set up "genambig" object to edit
mygen <- new("genambig", samples = c("a", "b", "c"),
             loci = c("loc1", "loc2"))
Genotypes(mygen, loci="loc1") <- list(c(133, 139, 142),
                                      c(130, 136, 139, 145),
                                      c(136, 142))
Genotypes(mygen, loci="loc2") <- list(c(202, 204), Missing(mygen),
                                      c(200, 206, 208))
mygen <- reformatPloidies(mygen, output="one")
Ploidies(mygen) <- 4

# open up the data editor
mygen <- editGenotypes(mygen)

# view the results of your edits
viewGenotypes(mygen)

}



