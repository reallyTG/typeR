library(StratigrapheR)


### Name: pointsvg
### Title: Converts line, rect, polygon and polyline class SVG objects into
###   data frames
### Aliases: pointsvg

### ** Examples

# To show you how to import, we first have to have a svg file to import. The
#following lines of code will create a svg in a temporary files:

svg.file.directory <- tempfile(fileext = ".svg") # Creates temporary file
writeLines(example.ammonite.svg, svg.file.directory) # Writes svg in the file

print(paste("An example .svg file was created at ", svg.file.directory,
            sep = ""))

# The pointsvg function allows to import simple svg drawings into R

ammonite.drawing <- pointsvg(file = svg.file.directory) # Provide file

plot(c(-2,2), c(-2,2), type = "n")

placesvg(ammonite.drawing)

# If you want to import your own .svg file uncomment the following line:

# pointsvg(file.choose())




