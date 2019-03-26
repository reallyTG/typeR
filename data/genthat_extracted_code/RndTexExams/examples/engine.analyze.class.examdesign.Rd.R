library(RndTexExams)


### Name: engine.analyze.class.examdesign
### Title: Function that breaks latex file of exam class examdesign into a
###   dataframe (internal use)
### Aliases: engine.analyze.class.examdesign

### ** Examples

f.in <- system.file("extdata", "MyRandomTest_examdesign.tex", package = "RndTexExams")
my.text <- stringi::stri_read_lines(f.in)
Encoding(my.text) <- 'UTF-8'

out <- engine.analyze.class.examdesign(my.text)




