library(paleotree)


### Name: createMrBayesTipDatingNexus
### Title: Construct a Fully Formatted NEXUS Script for Performing
###   Tip-Dating Analyses With MrBayes
### Aliases: createMrBayesTipDatingNexus tipdating

### ** Examples


# let's do some examples

# load retiolitid dataset
data(retiolitinae)

# let's try making a NEXUS file!

# Use a uniform prior, with a 10 million year offset for
	# the expected tree age from the earliest first appearance
# set average tree age to be 10 Ma earlier than first FAD

outgroupRetio <- "Rotaretiolites" # sister to all other included taxa

# the following will create a NEXUS file with an 'empty' morph matrix
	# with the only topological constraint on ingroup monophyly
	# Probably shouldn't do this: leaves too much to the FBD prior
 
# with doNotRun set to TRUE for troubleshooting

createMrBayesTipDatingNexus(tipTimes = retioRanges,
		outgroupTaxa = outgroupRetio,treeConstraints = NULL,
		ageCalibrationType = "uniformRange",whichAppearance = "first",
		treeAgeOffset = 10,	newFile = NULL,	
		origNexusFile = NULL,createEmptyMorphMat = TRUE,
		runName = "retio_dating",doNotRun = TRUE)

# let's try it with a tree for topological constraints
     # this requires setting outgroupTaxa to NULL
# let's also set doNotRun to FALSE

createMrBayesTipDatingNexus(tipTimes = retioRanges,
		outgroupTaxa = NULL,treeConstraints = retioTree,
		ageCalibrationType = "uniformRange",whichAppearance = "first",
		treeAgeOffset = 10,	newFile = NULL,	
		origNexusFile = NULL,createEmptyMorphMat = TRUE,
		runName = "retio_dating",doNotRun = FALSE)

# the above is essentially cal3 with a better algorithm,
		# and no need for a priori rate estimates
# just need a tree and age estimates for the tips!

#############################################################################
# some more variations for testing purposes

# no morph matrix supplied or generated
	# you'll need to manually append to an existing NEXUS file
createMrBayesTipDatingNexus(tipTimes = retioRanges,
		outgroupTaxa = NULL,treeConstraints = retioTree,
		ageCalibrationType = "uniformRange",whichAppearance = "first",
		treeAgeOffset = 10,	newFile = NULL,	
		origNexusFile = NULL,createEmptyMorphMat = FALSE,
		runName = "retio_dating",doNotRun = TRUE)

## Not run: 
##D 
##D # let's actually try writing an example with topological constraints
##D 	# to file and see what happens
##D 
##D # here's my super secret MrBayes directory
##D file <- "D:\\dave\\workspace\\mrbayes\\exampleRetio.nex"
##D 
##D createMrBayesTipDatingNexus(tipTimes = retioRanges,
##D 		outgroupTaxa = NULL,treeConstraints = retioTree,
##D 		ageCalibrationType = "uniformRange",whichAppearance = "first",
##D 		treeAgeOffset = 10,	newFile = file,	
##D 		origNexusFile = NULL,createEmptyMorphMat = TRUE,
##D 		runName = "retio_dating",doNotRun = FALSE)
##D 
## End(Not run)




