library(MatrixEQTL)


### Name: plot.MatrixEQTL
### Title: Plot histogram or QQ-plot of all p-values
### Aliases: plot.MatrixEQTL
### Keywords: QQ-plot histogram

### ** Examples

library(MatrixEQTL)

# Number of samples
n = 100 

# Number of variables
ngs = 2000

# Common signal in all variables
pop = 0.2*rnorm(n)

# data matrices
snps.mat = matrix(rnorm(n*ngs), ncol = ngs) + pop
gene.mat = matrix(rnorm(n*ngs), ncol = ngs) + pop + snps.mat*((1:ngs)/ngs)^9/2

# data objects for Matrix eQTL engine
snps1 = SlicedData$new( t( snps.mat ) )
gene1 = SlicedData$new( t( gene.mat ) )
cvrt1 = SlicedData$new( )
rm(snps.mat, gene.mat)

# Slice data in blocks of 500 variables
snps1$ResliceCombined(500)
gene1$ResliceCombined(500)

# Produce no output files
filename = NULL # tempfile()

# Perform analysis recording information for a histogram
meh = Matrix_eQTL_engine(
    snps = snps1, 
    gene = gene1, 
    cvrt = cvrt1, 
    output_file_name = filename, 
    pvOutputThreshold = 1e-100, 
    useModel = modelLINEAR, 
    errorCovariance = numeric(), 
    verbose = TRUE,
    pvalue.hist = 100)
    
plot(meh, col="grey")

# Perform analysis recording information for a QQ-plot
meq = Matrix_eQTL_engine(
    snps = snps1, 
    gene = gene1, 
    cvrt = cvrt1, 
    output_file_name = filename,
    pvOutputThreshold = 1e-6, 
    useModel = modelLINEAR, 
    errorCovariance = numeric(), 
    verbose = TRUE,
    pvalue.hist = "qqplot")
    
plot(meq)



