library(LeafArea)


### Name: run.ij
### Title: Automated leaf area analysis
### Aliases: run.ij
### Keywords: ~kwd1 ~kwd2

### ** Examples

# As long as ImageJ application, including ij.jar and java, is installed in the following directory,
# you do not have to specify the path to ImageJ
# /Applications/ImageJ <Mac>
# C:/Program Files/ImageJ <Windows>
# Linux always needs to specify the path to ImageJ. For example, path = "~/ImageJ"

# prepare the target directory that contains example image files
ex.dir <- eximg()
list.files(ex.dir)

#run automated images analysis
run.ij(set.directory = ex.dir, save.image=TRUE)

# note: in this example, analyzed images are exported to a temporary 
# directory, which will be eventually deleted. 
# If you choose your home directory as the target directory, 
# analyzed images will be exported to it.



