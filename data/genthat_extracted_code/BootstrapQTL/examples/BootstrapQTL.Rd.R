library(BootstrapQTL)


### Name: BootstrapQTL
### Title: Bootstrap QTL analysis for accurate effect size estimation
### Aliases: BootstrapQTL

### ** Examples

# Locations for example data from the MatrixEQTL package
base.dir = find.package('MatrixEQTL');
SNP_file_name = paste(base.dir, "/data/SNP.txt", sep="");
snps_location_file_name = paste(base.dir, "/data/snpsloc.txt", sep="");
expression_file_name = paste(base.dir, "/data/GE.txt", sep="");
gene_location_file_name = paste(base.dir, "/data/geneloc.txt", sep="");
covariates_file_name = paste(base.dir, "/data/Covariates.txt", sep="");

# Load the SNP data
snps = SlicedData$new();
snps$fileDelimiter = "\t";      # the TAB character
snps$fileOmitCharacters = "NA"; # denote missing values;
snps$fileSkipRows = 1;          # one row of column labels
snps$fileSkipColumns = 1;       # one column of row labels
snps$fileSliceSize = 2000;      # read file in slices of 2,000 rows
snps$LoadFile(SNP_file_name);

# Load the data detailing the position of each SNP
snpspos = read.table(snps_location_file_name, header = TRUE, stringsAsFactors = FALSE);

# Load the gene expression data
gene = SlicedData$new();
gene$fileDelimiter = "\t";      # the TAB character
gene$fileOmitCharacters = "NA"; # denote missing values;
gene$fileSkipRows = 1;          # one row of column labels
gene$fileSkipColumns = 1;       # one column of row labels
gene$fileSliceSize = 2000;      # read file in slices of 2,000 rows
gene$LoadFile(expression_file_name);

# Load the data detailing the position of each gene
genepos = read.table(gene_location_file_name, header = TRUE, stringsAsFactors = FALSE);

# Load the covariates data
cvrt = SlicedData$new();
cvrt$fileDelimiter = "\t";      # the TAB character
cvrt$fileOmitCharacters = "NA"; # denote missing values;
cvrt$fileSkipRows = 1;          # one row of column labels
cvrt$fileSkipColumns = 1;       # one column of row labels
if(length(covariates_file_name)>0) {
  cvrt$LoadFile(covariates_file_name);
}

# Run the BootstrapQTL analysis
eQTLs <- BootstrapQTL(snps, gene, snpspos, genepos, cvrt, n_bootstraps=10, n_cores=2)




