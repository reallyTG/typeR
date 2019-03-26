### R code from vignette source 'geno2proteoIntroduction.Rnw'

###################################################
### code chunk number 1: options
###################################################
options(width=72)


###################################################
### code chunk number 2: biocLite (eval = FALSE)
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite("geno2proteo")


###################################################
### code chunk number 3: example_generatingCDSaaFile
###################################################
library(geno2proteo)

dataFolder = system.file("extdata", package="geno2proteo")
geneticCodeFile = file.path(dataFolder, "geneticCode_standardTable_lines.txt")
gtfFile_chr16 = file.path(dataFolder,
"Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz")
DNAfastaFile_chr16 =  file.path(dataFolder, 
"Homo_sapiens.GRCh37.74.dna.chromosome.16.fa_theFirst3p5M.txt.gz");

tmpFolder = tempdir();

generatingCDSaaFile(geneticCodeFile_line=geneticCodeFile, 
gtfFile=gtfFile_chr16, DNAfastaFile=DNAfastaFile_chr16, 
outputFolder=tmpFolder, perlExec="perl")


###################################################
### code chunk number 4: example_genomicLocsToProteinSequence
###################################################
library(geno2proteo)

dataFolder = system.file("extdata", package="geno2proteo")
# the input file
inputFile_loci=file.path(dataFolder, 
    "transId_pfamDomainStartEnd_chr16_Zdomains_22examples_genomicPos.txt")
#the CDSs data file
CDSaaFile=file.path(dataFolder, 
    "Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz") 
#the input data
inputLoci = read.table(inputFile_loci, sep='\t', stringsAsFactors=FALSE, 
    header=TRUE)
inputLoci = inputLoci[,1:4] # here just use the first 4 columns of input data. 
# But the input data can have as many extra columns as you like.
proteinSeq = genomicLocsToProteinSequence(inputLoci=inputLoci, 
CDSaaFile=CDSaaFile)
# the 1st and 5th genomic loci in the input
inputLoci[c(1,5),] 
# the DNA and protein sequences of the coding regions within the two loci
proteinSeq[c(1,5),] 



###################################################
### code chunk number 5: example_genomicLocsToWholeDNASequence
###################################################
library(geno2proteo)

dataFolder = system.file("extdata", package="geno2proteo")
inputFile_loci=file.path(dataFolder, 
    "transId_pfamDomainStartEnd_chr16_Zdomains_22examples_genomicPos.txt")
DNAfastaFile =  file.path(dataFolder, 
    "Homo_sapiens.GRCh37.74.dna.chromosome.16.fa_theFirst3p5M.txt.gz");

inputLoci = read.table(inputFile_loci, sep='\t', stringsAsFactors=FALSE, 
    header=TRUE)
inputLoci = inputLoci[,1:4] # here just use the first 4 columns of input data. 
# But the input data can have as many extra columns as you like.
tmpFolder = tempdir();
DNASeqNow = genomicLocsToWholeDNASequence(inputLoci=inputLoci, 
    DNAfastaFile=DNAfastaFile, tempFolder=tmpFolder, perlExec="perl")

inputLoci[c(1,5),] # the 1st and 5th genomic loci in the input

DNASeqNow[c(1,5),] # the whole DNA sequences of the two loci



###################################################
### code chunk number 6: example_proteinLocsToGenomic
###################################################
library(geno2proteo)

dataFolder = system.file("extdata", package="geno2proteo")
# first using the ENSEMBL protein ID to specify the proteins
inputFile_loci=file.path(dataFolder, 
"transId_pfamDomainStartEnd_chr16_Zdomains_22examples_proteinID.txt")
CDSaaFile=file.path(dataFolder, 
"Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz")

inputLoci = read.table(inputFile_loci, sep='\t', stringsAsFactors=FALSE, 
header=TRUE)

genomicLoci = proteinLocsToGenomic(inputLoci=inputLoci, CDSaaFile=CDSaaFile)

inputLoci[c(1,5),] # the 1st and 5th protein sections in the input data

genomicLoci[c(1,5),] # the genomic locations of these protein sections

# then using the ENSEMBL transcript ID to specify the proteins
inputFile_loci=file.path(dataFolder, 
"transId_pfamDomainStartEnd_chr16_Zdomains_22examples.txt")
inputLoci = read.table(inputFile_loci, sep='\t', stringsAsFactors=FALSE, 
header=TRUE)
genomicLoci = proteinLocsToGenomic(inputLoci=inputLoci, CDSaaFile=CDSaaFile)

inputLoci[c(1,5),] # the 1st and 5th protein sections in the input data

genomicLoci[c(1,5),] # the genomic locations of these protein sections



###################################################
### code chunk number 7: example_proteinLocsToProteinSeq
###################################################
library(geno2proteo)

dataFolder = system.file("extdata", package="geno2proteo")
inputFile_loci=file.path(dataFolder, 
"transId_pfamDomainStartEnd_chr16_Zdomains_22examples_proteinID.txt")
CDSaaFile=file.path(dataFolder, 
"Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz")

inputLoci = read.table(inputFile_loci, sep='\t', stringsAsFactors=FALSE,
header=TRUE)

ProtSeqNow = proteinLocsToProteinSeq(inputLoci=inputLoci, CDSaaFile=CDSaaFile)

inputLoci[c(1,5),] # the 1st and 5the protein sections in the input data

ProtSeqNow[c(1,5),] # the protein sequences of these protein sections



