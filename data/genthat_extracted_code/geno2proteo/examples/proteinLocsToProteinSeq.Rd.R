library(geno2proteo)


### Name: proteinLocsToProteinSeq
### Title: Obtaining the amino acid sequences of a list of protein sections
### Aliases: proteinLocsToProteinSeq

### ** Examples

    dataFolder = system.file("extdata", package="geno2proteo")
    inputFile_loci=file.path(dataFolder, 
        "transId_pfamDomainStartEnd_chr16_Zdomains_22examples.txt")
    CDSaaFile=file.path(dataFolder, 
        "Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz")

    inputLoci = read.table(inputFile_loci, sep="\t", stringsAsFactors=FALSE)

    ProtSeqNow = proteinLocsToProteinSeq(inputLoci=inputLoci, 
                                            CDSaaFile=CDSaaFile)




