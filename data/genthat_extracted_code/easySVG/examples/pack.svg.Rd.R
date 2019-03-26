library(easySVG)


### Name: pack.svg
### Title: pack svg
### Aliases: pack.svg

### ** Examples

pack.svg(pack.content = "<text x=\"10\" y=\"20\"> this is a svg element </text>")
pack.content <- list(svg1 = "<text x=\"10\" y=\"20\"> this is a svg element </text>",
                     svg2 = "<text x=\"10\" y=\"40\"> this is a svg element </text>")
pack_info <- pack.svg(pack.content = pack.content)
message(pack_info)




