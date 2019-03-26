library(repr)


### Name: repr_*.recordedplot
### Title: Plot representations
### Aliases: repr_*.recordedplot repr_text.recordedplot
###   repr_png.recordedplot repr_jpg.recordedplot repr_svg.recordedplot
###   repr_pdf.recordedplot

### ** Examples

dev.new()
dev.control(displaylist = 'enable')
plot(sqrt, main = 'Square root')
p <- recordPlot()
dev.off()

repr_text(p)




