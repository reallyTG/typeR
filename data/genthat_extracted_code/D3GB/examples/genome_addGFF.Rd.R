library(D3GB)


### Name: genome_addGFF
### Title: Add track in a gff file to 'genomebrowser'.
### Aliases: genome_addGFF

### ** Examples

## Not run: 
##D # Download fasta file
##D fasta <- tempfile()
##D download.file(paste0("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/297/395/",
##D "GCF_000297395.2_ASM29739v2/GCF_000297395.2_ASM29739v2_genomic.fna.gz"),fasta)
##D 
##D # Genome browser generation.
##D # It creates a genome browser ready to be viewed in Firefox.
##D # For a server version, ready to be shared with Apache as a Website, set the parameter server=True
##D gb <- genomebrowser(getAssemblyFromFasta(fasta), dir = "Micromonospora_gff")
##D 
##D genome_addSequence(gb,fasta)
##D 
##D # Download gff file and add to the genome browser
##D gff <- tempfile()
##D download.file(paste0("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/297/395/",
##D "GCF_000297395.2_ASM29739v2/GCF_000297395.2_ASM29739v2_genomic.gff.gz"),gff)
##D 
##D genome_addGFF(gb,gff)
## End(Not run)



