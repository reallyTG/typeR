library(biogram)


### Name: table_ngrams
### Title: Tabulate n-grams
### Aliases: table_ngrams

### ** Examples

seqs_pos <- matrix(sample(c("a", "c", "g", "t"), 100, replace = TRUE, 
            prob = c(0.2, 0.4, 0.35, 0.05)), ncol = 5)
seqs_neg <- matrix(sample(c("a", "c", "g", "t"), 100, replace = TRUE), 
            ncol = 5)
tab <- table_ngrams(seq = rbind(seqs_pos, seqs_neg), 
                    ngrams = c("1_c.t_0", "1_g.g_0", "2_t.c_0", "2_g.g_0", "3_c.c_0", "3_g.c_0"), 
                    target = c(rep(1, 20), rep(0, 20)))
# see the results
print(tab)
# easily plot the results using ggplot2



