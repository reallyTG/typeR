library(MSnbase)


### Name: Chromatograms-class
### Title: Container for multiple Chromatogram objects
### Aliases: Chromatograms-class coerce,matrix,Chromatograms-method
###   Chromatograms show,Chromatograms-method
###   [,Chromatograms,ANY,ANY,ANY-method [<-,Chromatograms-method
###   plot,Chromatograms,ANY-method phenoData,Chromatograms-method
###   pData,Chromatograms-method pData<-,Chromatograms,data.frame-method
###   $,Chromatograms-method $<-,Chromatograms-method
###   colnames<-,Chromatograms-method sampleNames,Chromatograms-method
###   sampleNames<-,Chromatograms,ANY-method isEmpty,Chromatograms-method
###   featureNames,Chromatograms-method featureNames<-,Chromatograms-method
###   featureData,Chromatograms-method
###   featureData<-,Chromatograms,ANY-method fData,Chromatograms-method
###   fData<-,Chromatograms,ANY-method fvarLabels,Chromatograms-method
###   rownames<-,Chromatograms-method precursorMz,Chromatograms-method
###   productMz,Chromatograms-method mz,Chromatograms-method
###   polarity,Chromatograms-method bin,Chromatograms-method
###   clean,Chromatograms-method

### ** Examples

## Creating some chromatogram objects to put them into a Chromatograms object
ints <- abs(rnorm(25, sd = 200))
ch1 <- Chromatogram(rtime = 1:length(ints), ints)
ints <- abs(rnorm(32, sd = 90))
ch2 <- Chromatogram(rtime = 1:length(ints), ints)
ints <- abs(rnorm(19, sd = 120))
ch3 <- Chromatogram(rtime = 1:length(ints), ints)
ints <- abs(rnorm(21, sd = 40))
ch4 <- Chromatogram(rtime = 1:length(ints), ints)

## Create a Chromatograms object with 2 rows and 2 columns
chrs <- Chromatograms(list(ch1, ch2, ch3, ch4), nrow = 2)
chrs

## Extract the first element from the second column. Extracting a single
## element always returns a Chromatogram object.
chrs[1, 2]

## Extract the second row. Extracting a row or column (i.e. multiple elements
## returns by default a list of Chromatogram objects.
chrs[2, ]

## Extract the second row with drop = FALSE, i.e. return a Chromatograms
## object.
chrs[2, , drop = FALSE]

## Replace the first element.
chrs[1, 1] <- ch3
chrs

## Add a pheno data.
pd <- data.frame(name = c("first sample", "second sample"),
    idx = 1:2)
pData(chrs) <- pd

## Column names correspond to the row names of the pheno data
chrs

## Access a column within the pheno data
chrs$name

## Access the m/z ratio for each row; this will be NA for the present
## object
mz(chrs)

## Create some random Chromatogram objects
ints <- abs(rnorm(123, mean = 200, sd = 32))
ch1 <- Chromatogram(rtime = seq_along(ints), intensity = ints, mz = 231)
ints <- abs(rnorm(122, mean = 250, sd = 43))
ch2 <- Chromatogram(rtime = seq_along(ints), intensity = ints, mz = 231)
ints <- abs(rnorm(125, mean = 590, sd = 120))
ch3 <- Chromatogram(rtime = seq_along(ints), intensity = ints, mz = 542)
ints <- abs(rnorm(124, mean = 1200, sd = 509))
ch4 <- Chromatogram(rtime = seq_along(ints), intensity = ints, mz = 542)

## Combine into a 2x2 Chromatograms object
chrs <- Chromatograms(list(ch1, ch2, ch3, ch4), byrow = TRUE, ncol = 2)

## Plot the second row
plot(chrs[2, , drop = FALSE])

## Plot all chromatograms
plot(chrs, col = c("#ff000080", "#00ff0080"))



