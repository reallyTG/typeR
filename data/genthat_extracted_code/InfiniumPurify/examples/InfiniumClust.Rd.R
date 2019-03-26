library(InfiniumPurify)


### Name: InfiniumClust
### Title: Tumor sample clustering from Infinium 450k array data
### Aliases: InfiniumClust

### ** Examples

## load example data
data(beta.emp)
normal.data <- beta.emp[,1:21]
tumor.data <- beta.emp[,22:31]

## estimate tumor purity
purity <- getPurity(tumor.data = tumor.data,tumor.type= "LUAD")

## cluster tumor samples accounting for tumor purity
out <- InfiniumClust(tumor.data,purity,K=3, maxiter=5, tol=0.001)



