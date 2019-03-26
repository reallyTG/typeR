library(geno2proteo)


### Name: genomicLocsToWholeDNASequence
### Title: Obtaining the DNA sequences of a list of genomic loci
### Aliases: genomicLocsToWholeDNASequence

### ** Examples


    dataFolder = system.file("extdata", package="geno2proteo")
    inputFile_loci=file.path(dataFolder, 
        "transId_pfamDomainStartEnd_chr16_Zdomains_22examples_genomicPos.txt")
    DNAfastaFile =  file.path(dataFolder, 
        "Homo_sapiens.GRCh37.74.dna.chromosome.16.fa_theFirst3p5M.txt.gz")

    inputLoci = read.table(inputFile_loci, sep="\t", stringsAsFactors=FALSE)
    
    tmpFolder = tempdir()

    DNASeqNow = genomicLocsToWholeDNASequence(inputLoci=inputLoci, 
                            DNAfastaFile=DNAfastaFile, tempFolder=tmpFolder)




