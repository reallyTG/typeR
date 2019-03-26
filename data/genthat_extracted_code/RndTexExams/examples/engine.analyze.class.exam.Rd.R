library(RndTexExams)


### Name: engine.analyze.class.exam
### Title: Function that breaks latex file of exam class exam into a
###   dataframe (internal use)
### Aliases: engine.analyze.class.exam

### ** Examples

f.in <- system.file("extdata", "MyRandomTest_exam.tex", package = "RndTexExams")
my.text <- stringi::stri_read_lines(f.in)
Encoding(my.text) <- 'UTF-8'

out <- engine.analyze.class.exam(my.text)




