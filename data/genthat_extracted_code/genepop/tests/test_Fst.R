cat("test_Fst.R:\n")


infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- Fst(locinfile,outputFile="sample.txt.FST")
expect_equal(readLines(outfile)[141],
             "           All:  0.0225      0.1921      0.2103")
outfile <- Fst(locinfile,pairs=TRUE,outputFile="sample.txt.ST2")
expect_equal(readLines(outfile)[68], "4      0.1514  0.0469  0.2688 ")
outfile <- Fst(locinfile,sizes=TRUE,outputFile="sample.txt.RHO")
expect_equal(readLines(outfile)[153],
             "           All:  0.2777      0.3095      0.5013")
outfile <- Fst(locinfile,sizes=TRUE,pairs=TRUE,outputFile="sample.txt.ST2")
expect_equal(readLines(outfile)[80], "4      0.6250  0.2408  0.2812 ")
