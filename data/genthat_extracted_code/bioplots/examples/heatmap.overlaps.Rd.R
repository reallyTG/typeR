library(bioplots)


### Name: heatmap.overlaps
### Title: Plot heatmat
### Aliases: heatmap.overlaps

### ** Examples

mat <- matrix(rnbinom(135, size = 10, prob = 0.2), nrow = 15, ncol = 9)
colnames(mat) <- paste0("Treat", 1:9)
rownames(mat) <- c("a", "b", "c", "d", "ab", "ac", "ad", "bc", "bd", "cd",
                   "abc", "abd", "acd", "bcd", "abcd")
head(mat)

heatmap.overlaps(mat)





