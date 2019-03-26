library(SanzCircos)


### Name: write_circos_links
### Title: write_circos_links
### Aliases: write_circos_links

### ** Examples


df <- data.frame(lin_id = c(1,2), chr1 = c(1,1), band1 = c(1,1),
chr1_start = c(1,5), chr1_end = c(5,8),
n1 = c(5,3), chr2 = c(1,2), band2 = c(2,1),
chr2_start = c(8,1), chr2_end = c(13,5), n2 = c(5,5))

write_circos_links(df = df, file_name = "links.txt", file_path = tempdir())



