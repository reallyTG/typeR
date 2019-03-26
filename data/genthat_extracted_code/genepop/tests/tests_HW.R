cat("tests_HW.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- test_HW(locinfile,"deficit","sample.txt.D")
expect_equal(readLines(outfile)[133],
             "ADH-5       1.0000  0.0000  -0.3333 -0.3750  19903 switches")
outfile <- test_HW(locinfile,"global deficit")
expect_equal(readLines(outfile)[48], " 0.3329  0.0048 24797.00")

outfile <- nulls(locinfile, "sample.txt.NUL") ## FR->FR no testthat check !

# Example in Guo & Thompson 1992 Table 5
infile <- system.file("extdata", "Rhesus.txt",package="genepop")
locinfile <- "Rhesus.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- HWtable_analysis(locinfile,which="Proba",batches = 1000,iterations = 1000)
expect_equal(readLines(outfile)[21],"P-value=0.684292; S.E=0.00830887 (241565 switches)")

