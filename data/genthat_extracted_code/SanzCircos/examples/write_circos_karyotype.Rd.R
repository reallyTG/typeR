library(SanzCircos)


### Name: write_circos_karyotype
### Title: write_circos_karyotype
### Aliases: write_circos_karyotype

### ** Examples


df <- data.frame(chrom = c(1, 1, 2, 2), band = c(1, 2, 1, 2), start = c(1, 5, 1, 8),
end = c(5, 10, 8, 13), n = c(5, 5, 8, 5))

write_circos_karyotype(df = df, chromosome_grouping = "chrom", band_grouping = "band",
start_position = "start", end_position = "end",
file_name = "karyotype.txt", file_path = tempdir())



