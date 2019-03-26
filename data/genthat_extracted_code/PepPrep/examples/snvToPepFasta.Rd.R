library(PepPrep)


### Name: snvToPepFasta
### Title: Single nucleotide variant (SNV) to peptide workflow
### Aliases: snvToPepFasta

### ** Examples

#load data and set arguments

#data.frame with SNVs
tbl <- system.file("extdata", "ExampleData.RData", package="PepPrep")
load(tbl)

glst <- data.frame(Genes="CAP1", stringsAsFactors=FALSE)

#peptide sequence
spath <- system.file("extdata", "ExampleHomo_sapiens.GRCh37.70.pep.all.fa", package="PepPrep")

#where to write the result and how to write
tpath <- paste0(getwd(), "/myTest_snvToPep.fasta")
width <- 60

#biomaRt settings
mymart <- "ensembl"
myarchive <- FALSE

#call workflow
## Not run: 
##D test <- snvToPepFasta(testtbl, glst, mymart, myarchive, spath, tpath,width)
##D test2 <- snvToPepFasta(testtbl, glst, mymart, myarchive, spath, tpath, width, intermediat= TRUE)
## End(Not run)



