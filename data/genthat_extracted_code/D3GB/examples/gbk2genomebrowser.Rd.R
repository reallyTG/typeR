library(D3GB)


### Name: gbk2genomebrowser
### Title: Generates an interactive genome browser.
### Aliases: gbk2genomebrowser

### ** Examples

## Not run: 
##D # Download GenBank file
##D gbff <- tempfile()
##D download.file(paste0("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/297/395/",
##D "GCF_000297395.2_ASM29739v2/GCF_000297395.2_ASM29739v2_genomic.gbff.gz"),gbff)
##D 
##D # Genome browser generation.
##D # It creates a genome browser ready to be viewed in Firefox.
##D # For a server version, ready to be shared with Apache as a Website, set the parameter server=True
##D gb <- gbk2genomebrowser(gbff, dir = "Micromonospora_gbk")
## End(Not run)



