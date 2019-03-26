library(RndTexExams)


### Name: rte.analyze.tex.file
### Title: Analyze a LaTeX file and convert it into a list
### Aliases: rte.analyze.tex.file

### ** Examples

latex.dir.out <- 'latexOut' # Name of folder where latex files are going
                            #(will create if it does not exists)

pdf.dir.out <- 'PdfOut'     # Name of folder where resulting pdf files are going

# Get latex example from package
f.in <- system.file("extdata", "MyRandomTest_examdesign.tex", package = "RndTexExams")

# Break latex file into a R list
list.out <- rte.analyze.tex.file(f.in,
                                latex.dir.out = latex.dir.out,
                                pdf.dir.out = pdf.dir.out)

print(list.out)



