library(genomicper)


### Name: read_pvals
### Title: Read GWAS p-values of association and Merge with SNP annotations
### Aliases: read_pvals
### Keywords: gwas pvalues

### ** Examples

## DEMO // WORKSPACE
data(demo,SNPsAnnotation)
all_data <- read_pvals(data_name=demo,snps_ann=SNPsAnnotation)

## Not run: 
##D ##
##D ##  Below is an example on how to annotate the SNPs prior the use of genomicper 
##D ##  using UCSC table browser and intersectBed from bedtools:
##D 
##D ##  The function intersectBed from bedtools can be used to annotate SNPs to genes. 
##D ##  This function needs the locations to be annotated as input, and a reference file
##D ##  to annotate to. Genomicper uses entrez gene ids to annotate associate SNPs-to genes-pathways. 
##D  
##D # prepare locations INPUT: chr	position	position	other-info
##D 
##D # 1       10763241        10763241        1_10763241_C_T_1
##D # 1       10764465        10764465        1_10764465_T_C_1
##D # 1       10767685        10767685        1_10767685_C_T_1
##D 
##D # Prepare the file to annotate to. Using UCSC table browser. 
##D # clade:Mammal	genome:Human	assembly: Feb2009(GRCh37/hg19)
##D # group: All tables	database:hg19 Table: knownToLocusLink 
##D # output format: selected fields from primary and related tables
##D # click on "get output" 
##D # Next select Linked Tables: kgXref and knownGene
##D # click on "allow filtering using fields in checked tables" 
##D # Select fields for output: 
##D 	# Entrez Gene ID from hg19.knownToLocusLink 
##D 	# Gene Symbol from hg19.kgXref
##D 	# Reference sequence chromosome or scaffold from hg19.knownGene
##D 	# + or - for strand from hg19.knownGene
##D 	# Transcription start position from hg19.knownGene
##D 	# Transcription end position from hg19.knownGene
##D # click on "get output"
##D # Table will include more than one mapping, to avoid results bias  decrease/increase 
##D # the min and max according to the wished annotations for a single gene 
##D # (eg. take min and max of all isoforms or desiered kb distance)
##D 
##D # Reformat Table to intersectBed accepted formats (eg.GTF/BED/VCF)
##D # awk 'BEGIN{FS="\t";OFS="\t"}{print $3,$5,$6,$1,$2,$4}' Genes_hg19_TableBrowser.txt | 
##D # sed 's/chr//g' | awk 'BEGIN{FS="\t";OFS="\t"}{if($1 !~ /[:alnum:]/) print $0}' > Genes_TEMP.txt
##D 
##D # R > 
##D # x <- read.table("Genes_TEMP.txt",sep="\t",header=F,stringsAsFactors=F)
##D # genes <- unique(sort(x[,5]))
##D # gene_table <- matrix(data=NA,ncol=6,nrow=0)
##D # for(i in genes){
##D 	# grids <- which(x[,5] == i)
##D 	# min <- x[grids[which.min(x[grids,2])],2]
##D 	# max <- x[grids[which.max(x[grids,3])],3]
##D 	# gene_table <- rbind(gene_table,c(x[grids[1],1],min,max,
##D 	#           x[grids[1],4],x[grids[1],5],x[grids[1],6])) 	
##D # }
##D # write.table(gene_table,file="Gene_Table.txt",col.names=F,row.names=F,sep="\t",quote=F)
##D # /exit R
##D 
##D ## If you are trying to intersect very large files and are having trouble 
##D ## with excessive memory usage, please presort your data by chromosome
##D ## and then by start position e.g.: sort -k1,1 -k2,2n in.bed > in.sorted.bed 
##D ## for BED files) and then use the -sorted option
##D ## sort -k1,1 -k2,2n Gene_Table.txt > Gene_Table_sorted.txt
##D 
##D ## Intersect command:
##D # intersectBed -a inp.txt -b Gene_Table_sorted.txt -wa -wb -sorted > temp
##D # Select Columns : SNP_ID,CHR,SNP_Location,GeneID,OtherAnnotation1,OtherAnnotation2
##D # awk 'BEGIN{FS="\t";OFS="\t"}{print $4,$5,$2,$8,$9,$10}' temp > SNP_Table_Annotation.txt
##D 
##D # data ready for genomicper:
##D # head SNP_Table_Annotation.txt
##D # rs1000313       1       15405489        23254   KAZN    +
##D # rs1002365       1       19797248        832     CAPZB   -
##D # rs1002487       1       26865971        6195    RPS6KA1 +
##D # rs1002358       1       53753718        7804    LRP8    -
##D # rs1001160       1       76358591        4438    MSH4    +
##D # rs1002784       1       76824595        256435  ST6GALNAC3      +
##D # rs1001193       1       147166377       400818  NBPF9   +
##D # rs1001193       1       147166377       728841  NBPF8   +
##D # rs1001193       1       147166377       728855  LINC00623       +
##D # rs1001193       1       147166377       653505  PPIAL4B +
## End(Not run)



