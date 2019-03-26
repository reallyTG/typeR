library(svglite)


### Name: svglite
### Title: An SVG Graphics Driver
### Aliases: svglite
### Keywords: device

### ** Examples

# Save to file
svglite("Rplots.svg")
plot(1:11, (-5:5)^2, type = 'b', main = "Simple Example")
dev.off()

# Supply system font aliases. First check the font can be located:
gdtools::match_family("Verdana")

# Then supply a list of aliases:
fonts <- list(sans = "Verdana", mono = "Times New Roman")
svglite("Rplots.svg", system_fonts = fonts)
plot.new()
text(0.5, 0.5, "Some text", family = "mono")
dev.off()

# See the fonts vignettes for more options to deal with fonts




