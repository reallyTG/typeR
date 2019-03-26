library(geno2proteo)


### Name: generatingCDSaaFile
### Title: Generating a file containing the DNA and AA sequences of all the
###   protein coding regions (CDSs) in a genome
### Aliases: generatingCDSaaFile

### ** Examples

    # the data folder in this package
    dataFolder = system.file("extdata", package="geno2proteo") 

    geneticCodeFile_line = file.path(dataFolder, 
                                    "geneticCode_standardTable_lines.txt")
    gtfFile = file.path(dataFolder, 
                "Homo_sapiens.GRCh37.74_chromosome16_35Mlong.gtf.gz")
    DNAfastaFile =  file.path(dataFolder, 
            "Homo_sapiens.GRCh37.74.dna.chromosome.16.fa_theFirst3p5M.txt.gz")
    
    outputFolder = tempdir(); # using the current folder as output folder
    # calling the function.
    generatingCDSaaFile(geneticCodeFile_line=geneticCodeFile_line, 
        gtfFile=gtfFile, DNAfastaFile=DNAfastaFile, outputFolder=outputFolder)
    
    filename00 = sub(".*/", "", gtfFile)
    # get the output file's name.
    outputFile = paste(outputFolder, "/", filename00, "_AAseq.txt.gz", sep="")
    # read the content of the output file into a data frame.
    aaSeq = read.table(outputFile, sep="\t", stringsAsFactors=FALSE)




