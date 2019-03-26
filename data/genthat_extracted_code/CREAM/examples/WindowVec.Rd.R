library(CREAM)


### Name: WindowVec
### Title: WindowVec is a function to specify window size for each order of
###   COREs
### Aliases: WindowVec

### ** Examples

InputData <- read.table(system.file("extdata", "A549_Chr21.bed",
package = "CREAM"), sep="\t")
colnames(InputData) <- c("chr", "start", "end")
MinLength <- 1000
if(nrow(InputData) < MinLength){
   stop(paste( "Number of functional regions is less than ", MinLength,
   ".", sep = "", collapse = ""))
}
peakNumMin <- 2
WScutoff <- 1.5
WindowVecFinal <- WindowVec(InputData, peakNumMin, WScutoff)



