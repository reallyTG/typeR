library(micropan)


### Name: panPrep
### Title: Preparing FASTA files for pan-genomics
### Aliases: panPrep

### ** Examples

# Using a protein file in the micropan package
xpth <- file.path(path.package("micropan"),"extdata")
prot.file <- file.path(xpth,"Example_proteins.fasta.xz")

# We need to uncompress it first...
tf <- tempfile(fileext=".xz")
s <- file.copy(prot.file,tf)
tf <- xzuncompress(tf)

# Prepping it, using the GID.tag "GID123"
out.file <- tempfile(fileext=".fasta")
prepped.file <- panPrep(tf,GID.tag="GID123",out.file) 

# Reading the prepped file
prepped <- readFasta(prepped.file)
print(prepped$Header[1:5])

# ...and cleaning...
s <- file.remove(tf,prepped.file)




