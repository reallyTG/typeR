library(CB2)


### Name: calc_mappability
### Title: A function to calculate the mappabilities of each NGS sample.
### Aliases: calc_mappability

### ** Examples

library(CB2)
library(magrittr)
library(tibble)
library(dplyr)
library(glue)
FASTA <- system.file("extdata", "toydata", "small_sample.fasta", package = "CB2")
ex_path <- system.file("extdata", "toydata", package = "CB2")

df_design <- tribble(
  ~group, ~sample_name,
  "Base", "Base1",  
  "Base", "Base2", 
  "High", "High1",
  "High", "High2") %>% 
    mutate(fastq_path = glue("{ex_path}/{sample_name}.fastq"))

cb2_count <- run_sgrna_quant(FASTA, df_design)
calc_mappability(cb2_count, df_design)




