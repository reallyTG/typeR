library(InfiniumPurify)


### Name: InfiniumPurify
### Title: Purify tumor methylomes caused by normal cell contamination.
### Aliases: InfiniumPurify

### ** Examples


## load example data
data(beta.emp)

normal.data <- beta.emp[,1:21]
tumor.data <- beta.emp[,22:61]

## estimate tumor purity
purity <- getPurity(tumor.data = tumor.data,normal.data = NULL,tumor.type= "LUAD")

## correct tumor methylome by tumor purity
tumor.purified = InfiniumPurify(tumor.data = tumor.data[1:100,],
                                normal.data = normal.data[1:100,],
                                purity = purity)




