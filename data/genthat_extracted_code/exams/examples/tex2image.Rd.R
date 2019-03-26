library(exams)


### Name: tex2image
### Title: Transforming LaTeX Code Using ImageMagick or pdf2svg
### Aliases: tex2image
### Keywords: utilities

### ** Examples

## Not run: 
##D ## some simple LaTeX
##D tex <- c("This is \\textbf{bold} and this \\textit{italic}.",
##D   "Points on the unit circle: $x^2 + y^2 = 1$.")
##D 
##D ## default settings: PNG with sans serif fonts
##D tex2image(tex, show = interactive())
##D 
##D ## with fixed widths
##D tex2image(tex, width = 6, show = interactive())
##D tex2image(tex, width = 2, show = interactive())
##D 
##D ## switch off header (-> LaTeX uses its standard serif fonts)
##D tex2image(tex, header = NULL, show = interactive())
##D 
##D ## SVG output (system requirements: pdfcrop & pdf2svg)
##D tex2image(tex, format = "svg", show = TRUE)
## End(Not run)



