cat("tests_contingency.R:\n")

infile <- system.file("extdata", "structest.txt",package="genepop")
locinfile <- "structest.txt" # C:/home/francois/travail/stats/Genepop_R/structest.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
if (check) {
  outfile <- struc(locinfile) 
  expect_equal(readLines(outfile)[34],
                "P value=0.598782   S.E=0.006606 (243439 switches)")
} else {
  stop("Unable to copy to local file")
}
