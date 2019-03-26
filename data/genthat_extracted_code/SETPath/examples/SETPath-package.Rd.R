library(SETPath)


### Name: SETPath-package
### Title: Spiked Eigenvalue Test for Pathway data
### Aliases: SETPath-package SETPath
### Keywords: package

### ** Examples

#load data:
data(setpath.data)
# identify desired gene list:
genes.in.pathway = pathwaygenes[[1]]
# run test using theoretical quantiles to derive a p-value:
setpath(d1[,genes.in.pathway],d2[,genes.in.pathway],M=1,transform=NULL,verbose=TRUE,minalpha=NULL,
	normalize=TRUE,pvalue="chisq")
# now using a permutation test:
setpath(d1[,genes.in.pathway],d2[,genes.in.pathway],M=1,transform=NULL,verbose=TRUE,minalpha=NULL,
	normalize=TRUE,pvalue="permutation",npermutations=1000)
# now using the "transform" argument to test the null hypothesis that variability unrelated to the
#  first principal component (i.e. the sum of the second through final eigenvalues) is the same 
#  between classes:
setpath(d1[,genes.in.pathway],d2[,genes.in.pathway],M=1,transform=c(-1,1),verbose=TRUE,
	minalpha=NULL,normalize=TRUE,pvalue="chisq",npermutations=1000)
# now using the "transform" argument to test the compound null hypothesis that the second and third
#  eigenvalues are the same between classes:
linear.transformation = matrix(c(0,1,0,0,0,0,1,0),4)
print(linear.transformation)
setpath(d1[,genes.in.pathway],d2[,genes.in.pathway],M=3,transform=linear.transformation,
	verbose=TRUE,minalpha=NULL,normalize=TRUE,pvalue="chisq",npermutations=1000)

# use the function setpath.wrapper to analyze several pathways simultaneously
setpath.wrapper(d1,d2,pathwaygenes,pathwaynames,M=1,transform=NULL,minalpha=NULL,normalize=TRUE,
	pvalue="chisq",npermutations=10000)



