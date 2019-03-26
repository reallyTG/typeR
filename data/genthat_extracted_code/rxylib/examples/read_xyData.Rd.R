library(rxylib)


### Name: read_xyData
### Title: Import xy-Data for Supported Formats into R
### Aliases: read_xyData
### Keywords: IO

### ** Examples


##load example dataset
file <- system.file("extdata/ExampleSpectrum.CNF", package = "rxylib")
results <- read_xyData(file)
results

##plot xy-spectrum
plot(results,
 type = "l",
 log = "y",
 xlab = "Energy [keV]",
 ylab = "Counts",
 main = "Thorite - 1800 s")

mtext(side = 3, "Canberra Inspector 1000, 3 x 3 NaI probe")

##plot contour for TL-spectrum
##imported from an XSYG-file
spectrum <- read_xyData(system.file("extdata/TLSpectrum.xsyg", package = "rxylib"))
contour(
 x = spectrum$dataset[[1]]$data_block[,1],
 y = 1:ncol(spectrum$dataset[[1]]$data_block[,-1]),
 z = spectrum$dataset[[1]]$data_block[,-1],
 xlab = "Wavelength [nm]",
 ylab = "#Channel",
 main = "TL Spectrum")





