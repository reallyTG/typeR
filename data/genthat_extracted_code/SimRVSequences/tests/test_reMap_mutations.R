library(testthat)
context("reMap_mutations")

# create a dummy dataframe of exons
bds <- sample(5:100, size = 10)
bds <- bds[order(bds)]

exDat <- data.frame(chrom     = c(1, 1, 1, 1, 1),
                    exonStart = bds[1:length(bds) %% 2 != 0],
                    exonEnd   = bds[1:length(bds) %% 2 == 0])

#supply exDat to combine_exons to combine
# overlapping exon segments
#create the recombination map
rec_map <- create_slimMap(combine_exons(exDat))


#create mutations dataset
#NOTE: we do not expect mutations in non-exonic regions
mut_df <- data.frame(chrom = rep(1, 5),
                     position = sample(c(2:max(rec_map$endPos))[cut(2:max(rec_map$endPos),
                                                                    breaks = rec_map$endPos,
                                                                    labels = FALSE) %% 2 != 0],
                                       size = 5))

mut_df <- mut_df[order(mut_df$position), ]
mut_df2 <- reMap_mutations(mutationDF = mut_df, recomb_map = rec_map)

test_that("no mutations are mapped to non-exonic regions", {
  expect_true(all(cut(mut_df2$position, breaks = cumsum(rec_map$segLength), labels = FALSE) %% 2 != 0))
})
