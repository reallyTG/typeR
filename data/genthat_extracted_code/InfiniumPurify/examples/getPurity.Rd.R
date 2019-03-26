library(InfiniumPurify)


### Name: getPurity
### Title: Estimate the tumor purity for 450K methylation data
### Aliases: getPurity

### ** Examples


## load example data
data(beta.emp)

normal.data <- beta.emp[,1:21]
tumor.data <- beta.emp[,22:61]

## call purity for single tumor sample 
purity <- getPurity(tumor.data = tumor.data[,1],normal.data = NULL,tumor.type= "LUAD")

## call purity for less than 20 tumor samples
purity <- getPurity(tumor.data = tumor.data[,1:10],normal.data = NULL,tumor.type= "LUAD")

## call purity for more than 20 tumor samples with matched normal samples
purity <- getPurity(tumor.data = tumor.data[,1:40],normal.data = normal.data)



