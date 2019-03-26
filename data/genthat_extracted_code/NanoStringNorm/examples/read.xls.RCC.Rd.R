library(NanoStringNorm)


### Name: read.xls.RCC
### Title: read.xls.RCC
### Aliases: read.xls.RCC
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples

 
# directly import the nCounter output
path.to.xls.file <- system.file("extdata", "RCC_files", "RCCCollector1_rat_tcdd.xls",
	package = "NanoStringNorm");
NanoString.mRNA <- read.xls.RCC(x = path.to.xls.file, sheet = 1);




