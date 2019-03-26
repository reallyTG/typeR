library(SanzCircos)


### Name: make_circos_df_1
### Title: make_circos_df_1
### Aliases: make_circos_df_1

### ** Examples


df <- data.frame(population = c(rep("pop1", 10), rep("pop2", 10)),
isotype = c(rep("M", 4), rep("G", 6), rep("M", 6), "G", "G", "A", "A"),
lineageID = c(1, 2, 3, 4, 1, 1, 1, 2, 4, 5, 1, 1, 1, 5, 6, 7, 1, 3, 1, 1),
mut_freq = rnorm(20))

head(df)

circos_df <- make_circos_df_1(df)

head(circos_df)



