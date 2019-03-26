library(BIGDAWG)


### Name: BIGDAWG
### Title: BIGDAWG Main Wrapper Function
### Aliases: BIGDAWG

### ** Examples

### The following examples use the synthetic data set bundled with BIGDAWG

# Haplotype analysis with no missing genotypes for two loci sets
# Significant haplotypic association with phenotype
# BIGDAWG(Data="HLA_data", Run.Tests="H", Missing=0, Loci.Set=list(c("DRB1","DQB1")))

# Hardy-Weinberg and Locus analysis ignoring missing data
# Significant locus associations with phenotype at all but DQB1
# BIGDAWG(Data="HLA_data", Run.Tests="L", Missing="ignore")

# Hardy-Weinberg analysis trimming data to 2-Field resolution
# Significant locus deviation at DQB1
BIGDAWG(Data="HLA_data", Run.Tests="HWE", Trim=TRUE, Res=2)



