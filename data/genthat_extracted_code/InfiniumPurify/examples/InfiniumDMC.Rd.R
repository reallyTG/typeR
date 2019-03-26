library(InfiniumPurify)


### Name: InfiniumDMC
### Title: Differentially Methylation Calling accounting for tumor purity
### Aliases: InfiniumDMC

### ** Examples


## load example data
data(beta.emp)

normal.data <- beta.emp[,1:21]
tumor.data <- beta.emp[,22:61]

## estimate tumor purity
purity <- getPurity(tumor.data = tumor.data,normal.data = normal.data)

## DM calling with normal controls
DMC = InfiniumDMC(tumor.data = tumor.data,normal.data = normal.data,purity = purity)

## DM calling without normal control
DMC_ctlFree = InfiniumDMC(tumor.data = tumor.data,purity = purity)




