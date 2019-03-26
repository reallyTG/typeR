library(spatstat.data)


### Name: flu
### Title: Influenza Virus Proteins
### Aliases: flu
### Keywords: datasets

### ** Examples

data(flu)
  if(require(spatstat)) {
flu
Y <- flu$pattern[10]
Y <- flu[10, 1, drop=TRUE]
wildM1 <- with(flu, virustype == "wt" & stain == "M2-M1")
plot(flu[wildM1, 1, drop=TRUE], 
     main=c("flu data", "wild type virus, M2-M1 stain"),
     pch=c(3,16), cex=0.4, cols=2:3)
  }



