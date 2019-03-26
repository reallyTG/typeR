library(D3GB)


### Name: getAssemblyFromFasta
### Title: Create an assembly from a FASTA file for its use as parameter of
###   'genomebrowser' or 'genomemap'.
### Aliases: getAssemblyFromFasta

### ** Examples

# Download fasta file
fasta <- tempfile()
download.file(paste0("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/297/395/",
"GCF_000297395.2_ASM29739v2/GCF_000297395.2_ASM29739v2_genomic.fna.gz"),fasta)

# Assembly generation
getAssemblyFromFasta(fasta)



