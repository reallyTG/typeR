library(TCGAretriever)


### Name: trim_rnaseq_tcgadata
### Title: RNAseq Expression Data Trimmer
### Aliases: trim_rnaseq_tcgadata

### ** Examples

my_exprs <- t(sapply(1:10, (function(i){c(i, paste("gene", i, sep = "_"))})))
my_exprs <- cbind (my_exprs, matrix(1:80, nrow = 10)/80)
my_exprs[7, 4:10] <- "NaN"
my_exprs[1:10, 7] <- "NaN"
print("Low count treshold")
trim_rnaseq_tcgadata(data.frame(my_exprs), low_val_thr = 0.3)
print("High count treshold")
trim_rnaseq_tcgadata(data.frame(my_exprs), low_val_thr = 0.5)



