library(globalGSA)


### Name: globalFisher
### Title: Global Fisher combination method.
### Aliases: globalFisher ans2 ans21
### Keywords: globalFisher Fisher's combination global test

### ** Examples

# load the included example dataset. 
# This is a simulated case/control study data set 
# with 2000 patients (1000 cases / 1000 controls) 
# and 10 SNPs, where all of them have 
# a direct association with the outcome:
data(data)
#globalFisher(data, B=1000,  Gene="all", addit=FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans21)

# You can test:
globalFisher(data, B=1,  Gene="all", addit=FALSE)

# We consider that the first four SNPs 
# are included in "Gene1", 
# and the other six SNPs
# are included in "Gene2":
data(gene_list)
#globalFisher(data, B=1000, gene_list=gene_list, Gene="Gene1", addit=FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans2)

# You can test:
globalFisher(data, B=1, gene_list=gene_list, Gene="Gene1", addit=FALSE)



