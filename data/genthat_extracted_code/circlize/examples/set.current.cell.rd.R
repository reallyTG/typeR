library(circlize)


### Name: set.current.cell
### Title: Set flag to current cell
### Aliases: set.current.cell

### ** Examples

pdf(NULL)
circos.initialize(letters[1:8], xlim = c(0, 1))
circos.track(ylim = c(0, 1))
circos.info()
set.current.cell("b", 1)
circos.info()
circos.clear()
dev.off()



