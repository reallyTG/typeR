library(RndTexExams)


### Name: rte.build.rdn.test
### Title: Build random tests from LaTeX file
### Aliases: rte.build.rdn.test

### ** Examples

# define some options
latex.dir.out = 'latexOut' # Name of folder where latex files are going (will create if not exists)
pdf.dir.out = 'PdfOut'     # Name of folder where resulting pdf files are going
f.out <- 'MyRandomTest_'   # Name of pdfs (MyRandomTest_1.pdf, MyRandomTest_2.pdf, ... )
n.test <- 1                # Number of tests to build
n.question <- 2            # Number of questions in each test

# Get latex example from package
f.in <- system.file("extdata", "MyRandomTest_examdesign.tex", package = "RndTexExams")

# Break latex file into a R list
list.out <- rte.analyze.tex.file(f.in,
                                 latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out)

# Build pdfs
result.out <- rte.build.rdn.test(list.in = list.out,
                                 f.out = f.out,
                                 n.test = n.test,
                                 n.question = n.question,
                                 latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out)




