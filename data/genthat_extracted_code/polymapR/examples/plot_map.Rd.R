library(polymapR)


### Name: plot_map
### Title: Plot linkage maps
### Aliases: plot_map

### ** Examples

data("maplist_P1")
plot_map(maplist = maplist_P1, colname_in_mark = "nnfit", bg_col = "white",
         palette_in_mark = colorRampPalette(c("blue", "purple", "red")),
         highlight = list(c(20, 60),
         c(60,80),
         c(20,30),
         c(40,70),
         c(60,80)))



