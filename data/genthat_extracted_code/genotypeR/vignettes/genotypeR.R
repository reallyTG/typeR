## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  library(devtools)
#  devtools::install_git("https://github.com/StevisonLab/genotypeR")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
library(genotypeR)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## not run, but does work
## uncomment and run
## example_files <- system.file("SequenomMarkers_v2/two_sample/test_files", package = "genotypeR")

## vcf1 <- paste(example_files, "Sample1.vcf", sep="/")
## vcf2 <- paste(example_files, "Sample2.vcf", sep="/")

## look in outdir to look at the results in Master_SNPs.sorted.txt.
## outdir <- paste(example_files, "test_dir", sep="/")

## SequenomMarkers(vcf1, vcf2, outdir, platform="sq")


## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## not run, but does work
## uncomment and run
## #!/usr/bin/env Rscript

## library(genotypeR)

## example_files <- system.file("SequenomMarkers_v2/two_sample/test_files", package = "genotypeR")

## vcf1 <- paste(example_files, "Sample1.vcf", sep="/")
## vcf2 <- paste(example_files, "Sample2.vcf", sep="/")
## outdir <- paste(example_files, "test_dir", sep="/")

## SequenomMarkers(vcf1, vcf2, outdir, platform="sq")

## ---- echo=TRUE, eval=TRUE, results=TRUE---------------------------------
dir(system.file("extdata", package = "genotypeR"))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## read in marker data
data(markers)
## make marker names
marker_names <- make_marker_names(markers)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  write.csv(marker_names, "/your/dir/file.csv")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
  data(genotypes_data) 

  ## genotype table
  GT_table <- Ref_Alt_Table(marker_names)

  ## remove those markers that did not work
  genotypes_data_filtered <- genotypes_data[,c(1, 2, grep("TRUE", colnames(genotypes_data)%in%GT_table$marker_names))]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## warnings for a backcross design
##Note warning_allele is Ref allele
warnings_out <- initialize_genotypeR_data(seq_data = genotypes_data_filtered, genotype_table = GT_table, output="warnings")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## warnings for a backcross design
##Note warning_allele is Ref allele
warnings_out <- initialize_genotypeR_data(seq_data = genotypes_data_filtered, genotype_table = GT_table, output="warnings2NA")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
## warnings for a backcross design
##Note warning_allele is Ref allele
warnings_out <- initialize_genotypeR_data(seq_data = genotypes_data_filtered, genotype_table = GT_table, output="pass_through")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
##We are confident that the warngins should be turned into no Calls
warnings_out2NA <- initialize_genotypeR_data(seq_data = genotypes_data_filtered, genotype_table = GT_table, output = "warnings2NA")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
binary_coding_genotypes <- binary_coding(warnings_out2NA, genotype_table = GT_table)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  binary_coding_genotypes <- zero_one_two_coding(warnings_out2NA, genotype_table = GT_table)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
chr2 <- subsetChromosome(binary_coding_genotypes, chromosome="chr2")

crossover_count <- count_CO(chr2)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
##writes out the data
convert2qtl_table(chr2, chromosome_vect=rep(2, length(binary_genotypes(chr2))-2))

##reads in the data to rqtl
library(qtl)
rqtl_object <- read.cross("csv", ".", "temp_cross_for_qtl.csv", na.strings="NA")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  test_data <- read_in_illumina_GoldenGate(tab_delimited_file="path_to_goldengate_file", flanking_region_length=50, chromosome=rep("chr2", length.out=length(552960)))
#  
#  illumina_table <- illumina_Genoype_Table(tab_delimited_file="path_to_goldengate_file", flanking_region_length=50, chromosome=rep("chr2", length.out=length(552960)))
#  
#  
#  illumina_cross <- initialize_genotypeR_data(seq_data = test_data, genotype_table = illumina_table, output="warnings")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  ##accessor functions
#  impossible_genotype
#  genotypes
#  impossible_genotype
#  binary_genotypes
#  counted_crossovers
#  
#  ##replacement methods for:
#  genotypes
#  impossible_genotype
#  binary_genotypes
#  counted_crossovers

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
library(doBy)
to_count_CO <- binary_genotypes(chr2)
counted_per_individuals <- lapply(splitBy(~SAMPLE_NAME+WELL, data=to_count_CO), CO)

