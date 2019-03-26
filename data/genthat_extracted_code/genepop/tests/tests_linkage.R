cat("tests_linkage.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- test_LD(locinfile,"sample.txt.DIS")
expect_equal(readLines(outfile)[68],
             "last pop        ADH thre ADH-5      0.334362     0.000890   166751")
