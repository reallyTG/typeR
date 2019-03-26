library(geno2proteo)


### Name: genomicLocsToProteinSequence
### Title: Obtaining the protein sequences and DNA sequences of the coding
###   regions within a list of loci in genome
### Aliases: genomicLocsToProteinSequence

### ** Examples


    dataFolder = system.file("extdata", package="geno2proteo")
    inputFile_loci=file.path(dataFolder, 
        "transId_pfamDomainStartEnd_chr16_Zdomains_22examples_genomicPos.txt")
    CDSaaFile=file.path(dataFolder, 
        "Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz_AAseq.txt.gz")

    inputLoci = read.table(inputFile_loci, sep="\t", stringsAsFactors=FALSE)

    proteinSeq = genomicLocsToProteinSequence(inputLoci=inputLoci, 
                                            CDSaaFile=CDSaaFile)




