library(easySVG)


### Name: defs.svg
### Title: make SVG defs element
### Aliases: defs.svg

### ** Examples

defs.svg(defs.content = "<text x=\"10\" y=\"20\"> an SVG element </text>")
defs.content <- list(svg1 = "<text x=\"10\" y=\"30\"> an SVG element </text>",
                     svg2 = "<text x=\"10\" y=\"40\"> an SVG element </text>")
defs.svg(defs.content = defs.content)




