## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
library(D3GB)

# Download GenBank file
gbff <- tempfile()
download.file("ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/297/395/GCF_000297395.2_ASM29739v2/GCF_000297395.2_ASM29739v2_genomic.gbff.gz",gbff)

# Genome browser generation.
# It creates a genome browser ready to be viewed in Firefox.
# For a server version, ready to be shared with Apache as a Website, set the parameter server=True
gb <- gbk2genomebrowser(gbff, dir = "Micromonospora_Lupini_gbk")

## ----echo=TRUE, message=FALSE, warning=FALSE, eval=FALSE-----------------
#  library(D3GB)
#  
#  # Download fasta file
#  fasta <- tempfile()
#  download.file("ftp://ftp.ensembl.org/pub/release-84/fasta/saccharomyces_cerevisiae/dna/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.gz",fasta)
#  
#  # Genome browser generation.
#  gb <- genomebrowser(getAssemblyFromFasta(fasta), dir = "saccharomyces_genomebrowser")
#  
#  genome_addSequence(gb,fasta)
#  
#  # Download gff file and add to the genome browser
#  gff <- tempfile()
#  download.file('ftp://ftp.ensembl.org/pub/release-84/gff3/saccharomyces_cerevisiae/Saccharomyces_cerevisiae.R64-1-1.84.gff3.gz',gff)
#  
#  genome_addGFF(gb,gff)
#  
#  # Genome browser generation.
#  # It creates a genome browser ready to be viewed in Firefox.
#  # For a server version, ready to be shared with Apache as a Website, set the parameter server=True
#  gb <- gbk2genomebrowser(gbff, dir = "Micromonospora_Lupini_gbk")

## ----echo=TRUE, message=FALSE, warning=FALSE, eval=FALSE-----------------
#  library(D3GB)
#  
#  # Create a temporary dir
#  dir.create("temp")
#  
#  # Download original files and transform it to BED format
#  # Genes track
#  download.file("ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/refFlat.txt.gz","temp/refFlat.txt.gz")
#  genes <- read.delim("temp/refFlat.txt.gz",FALSE,quote="")
#  genes[,3] <- sub('chr','',genes[,3])
#  genes <- genes[genes[,3] %in% GRCh37[,1],]
#  exonSize <- apply(genes,1,function(x) paste(as.numeric(strsplit(x[11],",")[[1]])-as.numeric(strsplit(x[10],",")[[1]]),collapse=","))
#  exonStart <- apply(genes,1,function(x) paste(as.numeric(strsplit(x[10],",")[[1]])-as.numeric(x[5]),collapse=","))
#  genesBED <- data.frame(chr = genes[,3], start = genes[,5], end = genes[,6], name = genes[,1], score = genes[,2], strand = genes[,4], thickStart = genes[,7], thickEnd = genes[,8], itemRGB = NA, blockCount = genes[,9], blockSize = exonSize, blockStarts = exonStart)
#  
#  # Add PFAM domains
#  download.file("ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/ucscGenePfam.txt.gz","temp/ucscGenePfam.txt.gz")
#  domains <- read.delim("temp/ucscGenePfam.txt.gz",FALSE,quote="")
#  domains[,2] <- sub('chr','',domains[,2])
#  domains[,c(6,10)] <- NA
#  domainsBED <- domains[domains[,2] %in% GRCh37[,1],2:13]
#  
#  # Example of how to add tracks from a list. See below for other options
#  tracks <- list(refFlat = genesBED, Pfam = domainsBED)
#  # Specify tracks type an color
#  types <- c("exons","domain")
#  colors <- c("#B8860B","#000000")
#  
#  # Download GWAS Catalog in BED format
#  download.file("http://d3gb.usal.es/docs/data/GWAS_Catalog","temp/GWAS_Catalog")
#  
#  # Genome browser generation.
#  # It creates a genome browser ready to be viewed in Firefox.
#  # For a server version, ready to be shared with Apache as a Website, set the parameter server=True
#  gb <- genomebrowser(GRCh37.bands, tracks, types, colors, "temp/GWAS_Catalog", dir = "HumanGenomeBrowser")
#  
#  # Adding tracks one by one. This adds GWAS Catalog to the genome browser
#  genome_addTrack(gb,"temp/GWAS_Catalog","GWAS_Catalog","value","#A52A2A",c(0,100))
#  
#  # Add VEP annotated VCF
#  download.file("http://d3gb.usal.es/docs/data/trio_vep","temp/trio_vep")
#  genome_addVCF(gb,"temp/trio_vep","trio_vep",c('Existing_variation','Consequence','IMPACT','GMAF'))
#  
#  # ADD RNASeq tissue expression data
#  for(i in c("adipose_tissue", "adrenal_gland", "brain", "heart", "kidney", "liver", "lung", "ovary", "pancreas", "sigmoid_colon", "small_intestine", "spleen", "testis")){
#    download.file(paste0("http://d3gb.usal.es/docs/data/",i),paste0("temp/",i))
#    genome_addTrack(gb,paste0("temp/",i),i,"score")
#  }
#  
#  # Load genome sequence
#  download.file("ftp://ftp.ensembl.org/pub/grch37/release-85/fasta/homo_sapiens/dna/Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz","temp/GRCh37.fa.gz")
#  genome_addSequence(gb, "temp/GRCh37.fa.gz")
#  
#  unlink("temp",TRUE)

