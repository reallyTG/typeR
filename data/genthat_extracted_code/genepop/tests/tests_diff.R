cat("test_diff.R:\n")

infile <- system.file("extdata", "sample.txt",package="genepop")
locinfile <- "sample.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- test_diff(locinfile,outputFile="sample.txt.GE")
expect_equal(readLines(outfile)[116],"mtDNA          0.2106   ")
outfile <- test_diff(locinfile,pairs=TRUE,outputFile="sample.txt.GE2")
expect_equal(readLines(outfile)[157],"Tertre Rotebo & last pop      14.523536 12   0.268532")
#
outfile <- test_diff(locinfile,genic=FALSE,outputFile="sample.txt.G")
nums <- as.numeric(unlist(strsplit(readLines(outfile)[112], "[^0-9e.-]+"))[c(3,4,7)])
expect_equal(nums,c(81.0679,10,3.09949e-013))
# : avoiding potential e-11/e-011 mismatch
#
outfile <- test_diff(locinfile,genic=FALSE,pairs=TRUE,outputFile="sample.txt.2G2")
expect_equal(readLines(outfile)[146],"Bonneau 05    & last pop      32.503644 10   0.000330")
