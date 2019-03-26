library(GenoScan)


### Name: GenoScan.VCF.chr
### Title: Scan a VCF file to study the association between an
###   quantitative/dichotomous outcome variable and a region or whole
###   chromosome by score type statistics allowing for multiple functional
###   annotation scores.
### Aliases: GenoScan.VCF.chr
### Keywords: VCF scan

### ** Examples


# load example vcf file from package "seqminer"
vcf.filename = system.file("vcf/all.anno.filtered.extract.vcf.gz", package = "seqminer")

# simulated outcomes, covariates and inidividual id.
Y<-as.matrix(rnorm(3,0,1))
X<-as.matrix(rnorm(3,0,1))
id<-c("NA12286", "NA12341", "NA12342")

# fit null model
result.prelim<-GenoScan.prelim(Y,X=X,id=id,out_type="C",B=5000)

# scan the vcf file
result<-GenoScan.VCF.chr(result.prelim,vcf.filename,chr=1,pos.min=196621007,pos.max=196716634)


## this is how the actual genotype matrix from package "seqminer" looks like
example.G <- t(readVCFToMatrixByRange(vcf.filename, "1:196621007-196716634",annoType='')[[1]])




