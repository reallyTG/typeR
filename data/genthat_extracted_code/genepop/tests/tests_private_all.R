cat("tests_private_all.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- Nm_private(locinfile,"sample.txt.PRI")
expect_equal(readLines(outfile)[15],
             "Number of migrants after correction for size= 0.255145")
outfile <- basic_info(infile,"sample.txt.INF")
expect_equal(readLines(outfile)[798], "last pop   0.750 0.250 4     ")
