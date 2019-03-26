## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(CB2)
library(magrittr)
library(glue)
library(tibble)
library(dplyr)
library(ggplot2)

## ------------------------------------------------------------------------
# load the file path of the annotation file.
FASTA <- system.file("extdata", "toydata",
                     "small_sample.fasta",
                     package = "CB2")
system("tail -6 {FASTA}" %>% glue)

## ------------------------------------------------------------------------
FASTQ <- system.file("extdata", "toydata",
                     "Base1.fastq",
                     package = "CB2")
system("head -8 {FASTQ}" %>% glue)

## ------------------------------------------------------------------------
ex_path <- system.file("extdata", "toydata", package = "CB2")
Sys.glob("{ex_path}/*.fastq" %>% glue) %>% basename()

## ------------------------------------------------------------------------
df_design <- tribble(
  ~group, ~sample_name,
  "Base", "Base1",  
  "Base", "Base2", 
  "High", "High1",
  "High", "High2"
) %>% mutate(
  fastq_path = glue("{ex_path}/{sample_name}.fastq")
)

df_design

## ------------------------------------------------------------------------
cb2_count <- run_sgrna_quant(FASTA, df_design)

## ------------------------------------------------------------------------
head(cb2_count$count)

## ------------------------------------------------------------------------
head(cb2_count$total)

## ------------------------------------------------------------------------
get_CPM(cb2_count$count)

## ------------------------------------------------------------------------
plot_count_distribution(cb2_count$count %>% get_CPM, df_design)

## ------------------------------------------------------------------------
calc_mappability(cb2_count, df_design)

## ------------------------------------------------------------------------
plot_PCA(cb2_count$count %>% get_CPM, df_design)

## ------------------------------------------------------------------------
plot_corr_heatmap(cb2_count$count %>% get_CPM, df_design)

## ------------------------------------------------------------------------
sgrna_stat <- run_estimation(cb2_count$count, df_design, "High", "Base")
sgrna_stat

## ------------------------------------------------------------------------
gene_stats <- measure_gene_stats(sgrna_stat)
gene_stats

## ------------------------------------------------------------------------
gene_stats %>% 
  filter(fdr_ts < 0.1)

## ------------------------------------------------------------------------
plot_dotplot(cb2_count$count, df_design, "PARK2")

