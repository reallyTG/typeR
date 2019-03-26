library(PhySortR)


### Name: sortTrees
### Title: Sorts Phylogenetic Trees using Taxa Identifiers
### Aliases: sortTrees

### ** Examples

 ### Load data ###
 extdata <- system.file("extdata", package="PhySortR")
 file.copy(dir(extdata, full.names = TRUE), ".")
 dir.create("Algae_Trees/")
 file.copy(dir(extdata, full.names = TRUE), "Algae_Trees/")
 
 ### Examples ###
 # (1) Sorting using 3 target terms, all other parameters default. 
 sortTrees(target.groups = "Rhodophyta,Viridiplantae")
 
 # The function will search in the users current working directory for files 
 # with the extension ".tre" and check them (using default min.support, 
 # min.prop.target and clade.exclusivity) for Exclusive, All Exclusive or 
 # Non-Exclusive clades. A list will be returned with the names of the trees 
 # identified during sorting. 
 
 
 
 # (2) Sorting with a target directory and an out directory specified.
 sortTrees(target.groups = "Rhodophyta,Viridiplantae",
   in.dir= "Algae_Trees/", 
   out.dir="Sorted_Trees_RVG/", 
   mode = "c")
   
 # The function will search in "Algae_Trees/" for files with the extension
 # ".tre" and check them (using default min.support, min.prop.target, 
 # clade.exclusivity) for Exclusive, All Exclusive or Non-Exclusive clades. 
 # The function will both (a) return a list of the trees identified during 
 # sorting and (b) copy the files into their respective subdirectories of
 # "Algae_Trees/Sorted_Trees_RVG/Exclusive/", 
 # "Algae_Trees/Sorted_Trees_RVG/Exclusive/All_Exclusive/" and 
 # "Algae_Trees/Sorted_Trees_RVG/Non_Exclusive/".
 
 
 
 # (3) Sorting with in/out directories, min.prop.target and min.support specified.
 sortTrees(target.groups = "Rhodophyta,Viridiplantae",
   min.prop.target = 0.8,
   min.support = 90,
   in.dir= "Algae_Trees/",
   out.dir="Sorted_Trees_RVG_95/",
   mode = "c",
   clades.sorted = "NE",
   clade.exclusivity = 0.95)
   
 # The function will search in "Algae_Trees/" for files with the 
 # extension ".tre" and check them for only Non-Exclusive clades. 
 # A clade will only be defined if it has support >= 90 and contains at least
 # 80% of the total target leaves in the tree. A Non-Exclusive clade must also
 # be composed of >= 95% target taxa (i.e. < 5% non-target taxa).
 # The function will (a) return a list of the trees identified during 
 # sorting and (b) copy the trees identified during sorting to the out 
 # directory "Algae_Trees/Sorted_Trees_RVG/Non_Exclusive/".
 
 ### Clean up ###
 unlink("Algae_Trees", recursive=TRUE)
 unlink("Sorted_Trees.log")
 unlink(dir(".", ".*.tre$"))



