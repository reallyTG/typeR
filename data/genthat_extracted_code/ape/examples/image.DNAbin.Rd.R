library(ape)


### Name: image.DNAbin
### Title: Plot of DNA Sequence Alignement
### Aliases: image.DNAbin
### Keywords: hplot

### ** Examples

data(woodmouse)
image(woodmouse)
rug(seg.sites(woodmouse), -0.02, 3, 1)
image(woodmouse, "n", "blue") # show missing data
image(woodmouse, c("g", "c"), "green") # G+C
par(mfcol = c(2, 2))
### barcoding style:
for (x in c("a", "g", "c", "t"))
    image(woodmouse, x, "black", cex.lab = 0.5, cex.axis = 0.7)
par(mfcol = c(1, 1))
### zoom on a portion of the data:
image(woodmouse[11:15, 1:50], c("a", "n"), c("blue", "grey"))
grid(50, 5, col = "black")
### see the guanines on a black background:
image(woodmouse, "g", "yellow", "black")



