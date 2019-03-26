library(OrgMassSpecR)


### Name: SpectrumSimilarity
### Title: Similarity Between Two Mass Spectra
### Aliases: SpectrumSimilarity

### ** Examples


## With output.list = FALSE (default)
SpectrumSimilarity(example.spectrum.unknown, example.spectrum.authentic,
                   top.label = "unknown, electron impact", 
                   bottom.label = "derivatized alanine, electron impact",
                   xlim = c(25, 350))
# label peaks
plot.window(xlim = c(25,350), ylim = c(-125, 125))
text(c(73, 147, 158, 232, 260), c(100, 23, 44, 22, 15) + 10,
     c(73, 147, 158, 232, 260), cex = 0.75)
text(c(73, 147, 158, 232, 260), -c(100, 47, 74, 33, 20) - 10, 
     c(73, 147, 158, 232, 260), cex = 0.75)
mtext("Spectrum similarity", line = 1)

## With output.list = TRUE
x <- SpectrumSimilarity(example.spectrum.unknown, example.spectrum.authentic,
                   top.label = "unknown, electron impact", 
                   bottom.label = "derivatized alanine, electron impact",
                   xlim = c(25, 350), output.list = TRUE)

print(x)
grid.newpage()
grid.draw(x$plot) # draw to device



