library(FinePop)


### Name: read.frequency
### Title: Create an allele (haplotype) frequency data object of
###   populations from a frequency format file.
### Aliases: read.frequency

### ** Examples

# Example of frequency format file
data(jsmackerel)
cat(jsmackerel$mtDNA.freq, file="JSM_mtDNA_freq.txt", sep="\n")
cat(jsmackerel$popname, file="JSM_popname.txt", sep=" ")

# Read frequency format file with subpopulation names
# Prepare your frequency format file and population name file in the working directory
# (Here, these files were provided as "JSM_mtDNA_freq.txt" and "JSM_popname.txt".)
popdata.mt <- read.frequency(frequency="JSM_mtDNA_freq.txt", popname="JSM_popname.txt")

# Read frequency file without subpopulation names
popdata.mt.noname <- read.frequency(frequency="JSM_mtDNA_freq.txt")

# Fst estimation by EBFST
result.eb.mt <- EBFST(popdata.mt)
ebfst.mt <- result.eb.mt$pairwise$fst
write.csv(ebfst.mt, "result_EBFST_mtDNA.csv", na="")
print(as.dist(ebfst.mt))



