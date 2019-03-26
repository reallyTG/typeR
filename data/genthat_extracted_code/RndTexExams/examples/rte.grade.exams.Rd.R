library(RndTexExams)


### Name: rte.grade.exams
### Title: Grade exams built using rte.grade.exams
### Aliases: rte.grade.exams

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
list.build.rdn.exam <- rte.build.rdn.test(list.in = list.out,
                                          f.out = f.out,
                                          n.test = n.test,
                                          n.question = n.question,
                                          latex.dir.out = latex.dir.out,
                                          pdf.dir.out = pdf.dir.out,
                                          do.randomize.questions=TRUE,
                                          do.randomize.answers=TRUE,
                                          do.clean.up = TRUE)

# Grade it!
#' # create some (almost) random names
my.names <- c('John', 'Max','Marcelo')

# version of the test for each student
ver.test <- sample(seq(n.test),size = length(my.names),replace=TRUE)

# Get the correct answer sheet from previous code
correct.answer.sheet <- list.build.rdn.exam$answer.matrix

# create simulated answers from students (cheat a little bit!)
q.to.cheat <- 1  # get at least 1 question right!
my.answers <- cbind(correct.answer.sheet[ver.test,1:q.to.cheat],
                    matrix(sample(letters[1:5],
                                  replace = TRUE,
                                  size = length(my.names)*(n.question-q.to.cheat)),
                           ncol = n.question-q.to.cheat ))

# grade exams with rte.grade.exams
list.grade <- rte.grade.exams(exam.names = my.names,
                              exam.version = ver.test,
                              exam.answer.matrix = my.answers,
                              list.build.rdn.exam = list.build.rdn.exam)

print(list.grade$df.final.score)



