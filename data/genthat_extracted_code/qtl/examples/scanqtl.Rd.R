library(qtl)


### Name: scanqtl
### Title: General QTL scan
### Aliases: scanqtl
### Keywords: models

### ** Examples

data(fake.f2)

# take out several QTLs
qc <- c(1, 8, 13)
fake.f2 <- subset(fake.f2, chr=qc)

# imputate genotypes
## Don't show: 
fake.f2 <- subset(fake.f2, ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5, err=0.001)

# 2-dimensional genome scan with additive 3-QTL model
pos <- list(c(15,35), c(45,65), 28)
result <- scanqtl(fake.f2, pheno.col=1, chr=qc, pos=pos,
                  formula=y~Q1+Q2+Q3, method="hk")

# image of the results
# chr locations
chr1 <- as.numeric(matrix(unlist(strsplit(colnames(result),"@")),
                   ncol=2,byrow=TRUE)[,2])
chr8 <- as.numeric(matrix(unlist(strsplit(rownames(result),"@")),
                   ncol=2,byrow=TRUE)[,2])
# image plot
image(chr1, chr8, t(result), las=1, col=rev(rainbow(256,start=0,end=2/3)))

# do the same, allowing the QTLs on chr 1 and 13 to interact
result2 <- scanqtl(fake.f2, pheno.col=1, chr=qc, pos=pos,
                   formula=y~Q1+Q2+Q3+Q1:Q3, method="hk")
# image plot
image(chr1, chr8, t(result2), las=1, col=rev(rainbow(256,start=0,end=2/3)))



