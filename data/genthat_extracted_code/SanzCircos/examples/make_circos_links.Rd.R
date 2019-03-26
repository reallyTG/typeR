library(SanzCircos)


### Name: make_circos_links
### Title: make_circos_links
### Aliases: make_circos_links

### ** Examples


links_df <- data.frame(chrom = c(rep("chr1", 5), rep("chr2", 5)),
band = c(rep("band1", 3), rep("band2", 2), "band1", rep("band2", 4)),
link = c(1, 2, 3, 1, 2, 1, 1, 3, 4, 5),
start = c(1, 3, 5, 10, 35, 1, 5, 8, 13, 15),
end = c(3, 5, 10, 35, 39, 5, 8, 13, 15, 21))

links <- make_circos_links(links_df, "chrom", "band", "link", "start", "end", status = TRUE)

print(links)



