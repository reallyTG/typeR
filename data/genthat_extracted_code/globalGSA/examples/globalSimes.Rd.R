library(globalGSA)


### Name: globalSimes
### Title: Global Simes' combination method.
### Aliases: globalSimes ans3 ans31
### Keywords: globalSimes Simes' combination global test

### ** Examples

# load the included example dataset. 
# This is a simulated case/control study data set 
# with 2000 patients (1000 cases / 1000 controls) 
# and 10 SNPs, where all of them have 
# a direct association with the outcome:
data(data)
#globalSimes(data, B=1000,  Gene="all", addit=FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans31)

# You can test:
globalSimes(data, B=1,  Gene="all", addit=FALSE)

# We consider that the first four SNPs 
# are included in "Gene1", 
# and the other six SNPs
# are included in "Gene2":
data(gene_list)
#globalSimes(data, B=1000, gene_list=gene_list, Gene="Gene1", addit=FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans3)

# You can test:
globalSimes(data, B=1, gene_list=gene_list, Gene="Gene1", addit=FALSE)



