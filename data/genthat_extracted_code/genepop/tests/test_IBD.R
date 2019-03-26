cat("test_IBD.R:\n")

infile <- system.file("extdata", "w2.txt",package="genepop")
locinfile <- "w2.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- ibd(locinfile,"w2.txt.ISO", geographicScale = "Log", statistic="e")
if (sessionInfo()[["R.version"]][["arch"]]=="i386") { # i386 vs x64
  expect_equal(readLines(outfile)[229], "0.01514 [ -0.0143952 , 0.0374583 ]") 
} else expect_equal(readLines(outfile)[229], "0.01514 [ -0.0143947 , 0.0374584 ]")


infile <- system.file("extdata", "PEL1600withCoord.txt",package="genepop")
locinfile <- "PEL1600withCoord.txt"
check <- file.copy(infile,locinfile,overwrite=TRUE)
outfile <- ibd(locinfile,"PEL1600withCoord.ISO", statistic = "SingleGeneDiv",
               geographicScale = "1D")
nums <- as.numeric(unlist(strsplit(readLines(outfile)[59], "[^0-9e.-]+")))
expect_equal(nums,c(2.92606e-06, 6.28251e-07, 6.25044e-06))

