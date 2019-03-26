library(micropan)


### Name: getAccessions
### Title: Collecting contig accession numbers
### Aliases: getAccessions

### ** Examples

# The master record accession for the WGS genome Mycoplasma genitalium, strain G37
acc <- getAccessions("AAGX00000000")
# Then we use this to download all contigs and save them
tf <- tempfile(fileext=".fasta")
txt <- entrezDownload(acc,out.file=tf)

# Reading the file to inspect it
genome <- readFasta(tf)
summary(genome)

# ...cleaning...
s <- file.remove(tf)




