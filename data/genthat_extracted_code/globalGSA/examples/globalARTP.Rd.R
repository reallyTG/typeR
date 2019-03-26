library(globalGSA)


### Name: globalARTP
### Title: Global Adaptive Rank Truncated Product method.
### Aliases: globalARTP ans1 ans11
### Keywords: globalARTP global Adative Rank Truncated Product method

### ** Examples

# load the included example dataset. 
# This is a simulated case/control study data set 
# with 2000 patients (1000 cases / 1000 controls) 
# and 10 SNPs, where all of them have 
# a direct association with the outcome:
data(data)
#globalARTP(data, B=1000, K=10, Gene="all", addit = FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans11)

# You can test: 
globalARTP(data, B=1, K=10, Gene="all", addit = FALSE)

# We consider that the first four SNPs 
# are included in "Gene1", 
# and the other six SNPs
# are included in "Gene2":
data(gene_list)
#globalARTP(data, B=1000, K=10, gene_list=gene_list, Gene="Gene1", addit = FALSE)

# it may take some time,
# hence the result of this example is included:
data(ans1)

# You can test:
globalARTP(data, B=1, K=10, gene_list=gene_list, Gene="Gene1", addit = FALSE)



