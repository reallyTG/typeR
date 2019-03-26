library(genotypeR)


### Name: Heterogametic_Genotype_Warnings
### Title: Heterogametic warnings
### Aliases: Heterogametic_Genotype_Warnings

### ** Examples


data(genotypes_data)
seq_data <- genotypes_data
sex_vector <- do.call(rbind, strsplit(seq_data[,"SAMPLE_NAME"], split="_"))[,2]
Heterogametic_Genotype_Warnings(seq_data=seq_data, sex_chromosome="chrXL",
sex_vector=sex_vector, heterogametic_sex="M")




