library(micropan)


### Name: entrezDownload
### Title: Downloading genome data
### Aliases: entrezDownload

### ** Examples

# Accession numbers for the chromosome and plasmid of Buchnera aphidicola, strain APS
acc <- "BA000003.2,AP001071.1"
tf <- tempfile(pattern="Buchnera_aphidicola",fileext=".fasta")
txt <- entrezDownload(acc,out.file=tf)

# Reading file to inspect
genome <- readFasta(tf)
summary(genome)

# ...cleaning...
s <- file.remove(tf)




