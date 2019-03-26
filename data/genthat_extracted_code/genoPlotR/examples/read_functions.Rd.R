library(genoPlotR)


### Name: read_functions
### Title: Reading functions
### Aliases: read_functions read_dna_seg_from_tab read_dna_seg_from_file
###   read_dna_seg_from_embl read_dna_seg_from_genbank
###   read_dna_seg_from_fasta read_dna_seg_from_ptt
###   read_comparison_from_tab read_comparison_from_blast
###   read_mauve_backbone
### Keywords: file IO

### ** Examples

##
## From tabs
##
## Read DNA segment from tab
dna_seg3_file <- system.file('extdata/dna_seg3.tab', package = 'genoPlotR')
dna_seg3 <- read_dna_seg_from_tab(dna_seg3_file)

## Read comparison from tab
comparison2_file <- system.file('extdata/comparison2.tab',
                                package = 'genoPlotR')
comparison2 <- read_comparison_from_tab(comparison2_file)

##
## Mauve backbone
##
## File: this is only to retrieve the file from the genoPlotR
## installation folder. 
bbone_file <- system.file('extdata/barto.backbone', package = 'genoPlotR')
## Read backbone
## To read your own backbone, run something like
## bbone_file <- "/path/to/my/file.bbone"
bbone <- read_mauve_backbone(bbone_file)
names <- c("B_bacilliformis", "B_grahamii", "B_henselae", "B_quintana")
names(bbone$dna_segs) <- names
## Plot
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons)

## Using filter_low & changing reference sequence
bbone <- read_mauve_backbone(bbone_file, ref=2, filter_low=2000) 
names(bbone$dna_segs) <- names
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons)

## Read guide tree
tree_file <- system.file('extdata/barto.guide_tree', package = 'genoPlotR')
tree_str <- readLines(tree_file)
for (i in 1:length(names)){
  tree_str <- gsub(paste("seq", i, sep=""), names[i], tree_str)
}
tree <- newick2phylog(tree_str)
## Plot
plot_gene_map(dna_segs=bbone$dna_segs, comparisons=bbone$comparisons,
              tree=tree)

##
## From embl file
##
bq_embl_file <- system.file('extdata/BG_plasmid.embl', package = 'genoPlotR')
bq <- read_dna_seg_from_embl(bq_embl_file)

##
## From genbank file
##
bq_genbank_file <- system.file('extdata/BG_plasmid.gbk', package = 'genoPlotR')
bq <- read_dna_seg_from_file(bq_genbank_file, fileType="detect")

## Parsing extra fields in the genbank file
bq <- read_dna_seg_from_file(bq_genbank_file,
                             extra_fields=c("db_xref", "transl_table"))
names(bq)


##
## From ptt files
##
## From a file
bq_ptt_file <- system.file('extdata/BQ.ptt', package = 'genoPlotR')
bq <- read_dna_seg_from_ptt(bq_ptt_file)
## Read directly from NCBI ftp site:
url <- "ftp://ftp.ncbi.nih.gov/genomes/Bacteria/Bartonella_henselae_Houston-1/NC_005956.ptt"
attempt <- 0
## Not run: 
##D while (attempt < 5){
##D   attempt <- attempt + 1
##D   bh <- try(read_dna_seg_from_ptt(url))
##D   if (!inherits(bh, "try-error")) {
##D     attempt <- 99
##D   } else {
##D     print(paste("Tried", attempt, "times, retrying in 5s"))
##D     Sys.sleep(5)
##D   }
##D }
## End(Not run)
## If attempt to connect to internet fails
if (!exists("bh")){
  data(barto)
  bh <- barto$dna_segs[[3]]
}

##
## Read from blast
##
bh_vs_bq_file <- system.file('extdata/BH_vs_BQ.blastn.tab',
                             package = 'genoPlotR')
bh_vs_bq <- read_comparison_from_blast(bh_vs_bq_file, color_scheme="grey")

## Plot
plot_gene_map(dna_segs=list(BH=bh, BQ=bq), comparisons=list(bh_vs_bq),
              xlims=list(c(1,50000), c(1, 50000)))





