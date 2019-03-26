cat("test_Fis.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- genedivFis(locinfile,outputFile = "sample.txt.DIV")
expect_equal(readLines(outfile)[130], "                      0.6736     -0.0722")
outfile <- genedivFis(locinfile, sizes=TRUE
                      , outputFile = "sample.txt.MSD")
expect_equal(readLines(outfile)[141], "                      4.0556      0.4658")
