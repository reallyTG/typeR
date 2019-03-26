library(CREAM)


### Name: ElementRecog
### Title: ElementRecog is a function to identify COREs
### Aliases: ElementRecog

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
OutputList <- ElementRecog(InputData, WindowVecFinal,
(1+length(WindowVecFinal)), peakNumMin)



