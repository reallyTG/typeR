library(circlize)


### Name: circos.nested
### Title: Nested zooming with two circular plots
### Aliases: circos.nested

### ** Examples

## Not run: 
##D #### simulate data ####
##D set.seed(123)
##D df = data.frame(cate = sample(letters[1:8], 400, replace = TRUE),
##D                 x = runif(400),
##D                 y = runif(400),
##D                 stringsAsFactors = FALSE)
##D df = df[order(df[[1]], df[[2]]), ]
##D rownames(df) = NULL
##D df$interval_x = as.character(cut(df$x, c(0, 0.2, 0.4, 0.6, 0.8, 1.0)))
##D df$name = paste(df$cate, df$interval_x, sep = ":")
##D df$start = as.numeric(gsub("^\\((\\d(\\.\\d)?).*(\\d(\\.\\d)?)]", "\\1", df$interval_x))
##D df$end = as.numeric(gsub("^\\((\\d(\\.\\d)?),(\\d(\\.\\d)?)]$", "\\3", df$interval_x))
##D nm = sample(unique(df$name), 20)
##D df2 = df[df$name %in% nm, ]
##D 
##D correspondance = unique(df2[, c("cate", "start", "end", "name", "start", "end")])
##D zoom_sector = unique(df2[, c("name", "start", "end", "cate")])
##D zoom_data = df2[, c("name", "x", "y")]
##D 
##D data = df[, 1:3]
##D sector = data.frame(cate = letters[1:8], start = 0, end = 1, stringsAsFactors = FALSE)
##D 
##D sector_col = structure(rand_color(8, transparency = 0.5), names = letters[1:8])
##D 
##D #### define two circular plots ####
##D f1 = function() {
##D     circos.par(gap.degree = 10)
##D     circos.initialize(sector[, 1], xlim = sector[, 2:3])
##D     circos.track(data[[1]], x = data[[2]], y = data[[3]], ylim = c(0, 1), 
##D         panel.fun = function(x, y) {
##D             l = correspondance[[1]] == CELL_META$sector.index
##D             if(sum(l)) {
##D                 for(i in which(l)) {
##D                     circos.rect(correspondance[i, 2], CELL_META$cell.ylim[1],
##D                                 correspondance[i, 3], CELL_META$cell.ylim[2],
##D                                 col = sector_col[CELL_META$sector.index],
##D                                 border = sector_col[CELL_META$sector.index])
##D                 }
##D             }
##D             circos.points(x, y, pch = 16, cex = 0.5)
##D             circos.text(CELL_META$xcenter, CELL_META$ylim[2] + uy(2, "mm"), 
##D                 CELL_META$sector.index, niceFacing = TRUE, adj = c(0.5, 0))
##D     })
##D }
##D 
##D f2 = function() {
##D     circos.par(gap.degree = 2, cell.padding = c(0, 0, 0, 0))
##D     circos.initialize(zoom_sector[[1]], xlim = as.matrix(zoom_sector[, 2:3]))
##D     circos.track(zoom_data[[1]], x = zoom_data[[2]], y = zoom_data[[3]], 
##D         panel.fun = function(x, y) {
##D             circos.points(x, y, pch = 16, cex = 0.5)
##D         }, bg.col = sector_col[zoom_sector$cate],
##D         track.margin = c(0, 0))
##D }
##D circos.nested(f1, f2, correspondance, connection_col = sector_col[correspondance[[1]]])
## End(Not run)




