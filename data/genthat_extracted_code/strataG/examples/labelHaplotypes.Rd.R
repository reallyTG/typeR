library(strataG)


### Name: labelHaplotypes
### Title: Find and label haplotypes
### Aliases: labelHaplotypes labelHaplotypes.default labelHaplotypes.list
###   labelHaplotypes.character labelHaplotypes.gtypes

### ** Examples

# create 5 example short haplotypes
haps <- c(
  H1 = "ggctagct",
  H2 = "agttagct",
  H3 = "agctggct",
  H4 = "agctggct",
  H5 = "ggttagct"
)
# draw and label 100 samples
sample.seqs <- sample(names(haps), 100, rep = TRUE)
ids <- paste(sample.seqs, 1:length(sample.seqs), sep = "_")
sample.seqs <- lapply(sample.seqs, function(x) strsplit(haps[x], "")[[1]])
names(sample.seqs) <- ids

# add 1-2 random ambiguities
with.error <- sample(1:length(sample.seqs), 10)
for(i in with.error) {
  num.errors <- sample(1:2, 1)
  sites <- sample(1:length(sample.seqs[[i]]), num.errors)
  sample.seqs[[i]][sites] <- "n"
}

hap.assign <- labelHaplotypes(sample.seqs, prefix = "Hap.")
hap.assign




