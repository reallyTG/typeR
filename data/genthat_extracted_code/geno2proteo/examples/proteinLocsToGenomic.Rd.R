library(geno2proteo)


### Name: proteinLocsToGenomic
### Title: Obtaining the genomic coordinates for a list of protein sections
### Aliases: proteinLocsToGenomic

### ** Examples


    dataFolder = system.file("extdata", package="geno2proteo")
    inputFile_loci=file.path(dataFolder, 
        "transId_pfamDomainStartEnd_chr16_Zdomains_22examples.txt")
    CDSaaFile=file.path(dataFolder, 
        "Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz")

    inputLoci = read.table(inputFile_loci, sep="\t", stringsAsFactors=FALSE)

    genomicLoci = proteinLocsToGenomic(inputLoci=inputLoci, CDSaaFile=CDSaaFile)



