library(RndTexExams)


### Name: rte.compile.latex
### Title: Function to compile a LaTeX file
### Aliases: rte.compile.latex

### ** Examples

f.in <- system.file("extdata", "MyRandomTest_examdesign.tex", package = "RndTexExams")
pdf.dir.out <- 'PdfOut'

rte.compile.latex(f.in = f.in,
                 pdf.dir.out =  pdf.dir.out,latex.compile.fct = 'custom')




