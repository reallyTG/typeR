library(seqinr)


### Name: read.abif
### Title: Read ABIF formatted files
### Aliases: read.abif

### ** Examples

#
# Quality check:
#

data(JLO)
JLO.check <- read.abif(system.file("abif/2_FAC321_0000205983_B02_004.fsa", 
  package = "seqinr"))
stopifnot(identical(JLO, JLO.check))

#
# Try to reproduce figure 1A from Krawczyk et al. 2009:
#

Krawczyk <- read.abif(system.file("abif/samplefsa2ps.fsa", 
  package = "seqinr"))$Data
x <- 1:length(Krawczyk[["DATA.1"]])
par(mar = c(2,4,2,0)+0.1, cex = 0.5)
plot(x, Krawczyk[["DATA.1"]], type = "l", col = "blue",
  ylab = "", xlab = "",
  ylim = c(-2000, 10000), cex = 0.5,
  main = "Figure 1A from Krawczyk et al. 2009",
  xaxs = "i", yaxs = "i",
  xaxt = "n", yaxt = "n")
axis(1, at = seq(2000, 24000, by = 2000))
axis(2, at = seq(-1000, 10000, by = 1000), las = 1)
lines(x, Krawczyk[["DATA.2"]], col = "green")
lines(x, Krawczyk[["DATA.3"]], col = "black")
lines(x, Krawczyk[["DATA.4"]], col = "red")




