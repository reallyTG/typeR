library(testthat)
library(RndTexExams)

context("Analyze and build tests")

# define some options
latex.dir.out = 'latexOut' # Name of folder where latex files are going (will create if not exists)
pdf.dir.out = 'PdfOut'     # Name of folder where resulting pdf files are going
f.out <- 'MyRandomTest_'   # Name of pdfs (MyRandomTest_1.pdf, MyRandomTest_2.pdf, ... )
n.test <- 2                # Number of tests to build
n.question <- 4            # Number of questions in each test

# test with examdesign class

f.in <- system.file("extdata", "MyRandomTest_examdesign.tex", package = "RndTexExams")
list.out <- rte.analyze.tex.file(f.in, latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out)

test_that(desc = 'Test of rte.analyze.tex.file',{
  expect_is(list.out, 'list')
} )


result.out <- rte.build.rdn.test(list.in = list.out,
                                 f.out = f.out,
                                 n.test = n.test,
                                 n.question = n.question,
                                 latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out,
                                 do.randomize.questions=T,
                                 latex.compile.fct = 'custom',
                                 do.randomize.answers=T,
                                 do.clean.up = T)


nrow.answer.sheet = nrow(result.out$df.answer.wide)
test_that(desc = 'Test of rte.build.rdn.test (size answer sheet)',{
  expect_equal(nrow.answer.sheet, n.test)
} )

nrow.df = nrow(result.out$df.answer.long)
test_that(desc = 'Test of rte.build.rdn.test (size of df)',{
  expect_equal(nrow.df, n.test*n.question)
} )


# test with exam class

f.in <- system.file("extdata", "MyRandomTest_exam.tex", package = "RndTexExams")
list.out <- rte.analyze.tex.file(f.in, latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out)

test_that(desc = 'Test of rte.analyze.tex.file',{
  expect_is(list.out, 'list')
} )


result.out <- rte.build.rdn.test(list.in = list.out,
                                 f.out = f.out,
                                 n.test = n.test,
                                 n.question = n.question,
                                 latex.dir.out = latex.dir.out,
                                 pdf.dir.out = pdf.dir.out,
                                 do.randomize.questions=T,
                                 do.randomize.answers=T,
                                 do.clean.up = T)


nrow.answer.sheet = nrow(result.out$df.answer.wide)
test_that(desc = 'Test of rte.build.rdn.test (size answer sheet)',{
  expect_equal(nrow.answer.sheet, n.test)
} )

nrow.df = nrow(result.out$df.answer.long)
test_that(desc = 'Test of rte.build.rdn.test (size of df)',{
  expect_equal(nrow.df, n.test*n.question)
} )



cat('\nDeleting test folders')
unlink(c(latex.dir.out,pdf.dir.out), recursive = T)
