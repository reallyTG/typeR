library(SanzCircos)


### Name: write_circos_histogram
### Title: write_circos_histogram
### Aliases: write_circos_histogram

### ** Examples


df <- data.frame(chrom = c(1,1,2,2), start = c(1, 5, 1, 8),
end = c(5, 10, 8, 13), plotting_value = c(5, 78, 9, 2))

write_circos_histogram(df = df, chromosome_grouping = "chrom",
start_position = "start", end_position = "end",
value = "plotting_value", file_name = "histogram.txt", file_path = tempdir())




