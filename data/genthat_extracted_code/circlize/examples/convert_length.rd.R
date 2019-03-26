library(circlize)


### Name: convert_length
### Title: Convert units
### Aliases: convert_length

### ** Examples

fa = letters[1:10]
circos.par(cell.padding = c(0, 0, 0, 0), track.margin = c(0, 0))
circos.initialize(fa, xlim = cbind(rep(0, 10), runif(10, 0.5, 1.5)))
circos.track(ylim = c(0, 1), track.height = convert_length(5, "mm"))
circos.par(track.margin = c(0, convert_length(2, "mm")))
circos.track(ylim = c(0, 1), track.height = convert_length(1, "cm"))
circos.par(track.margin = c(0, convert_length(5, "mm")))
circos.track(ylim = c(0, 1), track.height = convert_length(1, "inches"))
circos.clear()



