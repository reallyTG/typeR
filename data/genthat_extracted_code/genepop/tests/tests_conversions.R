cat("test_conversions.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- conversion(locinfile, format="Fstat", "sample.txt.DAT")

outfile <- diploidize(inputFile = locinfile,outputFile="Dsample.txt")
expect_equal(readLines(outfile)[30]," last pop, 0101 002001 0101 0401 0807 0202 ")
