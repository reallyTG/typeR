library(gtools)


### Name: ASCIIfy
### Title: Convert Characters to ASCII
### Aliases: ASCIIfy
### Keywords: utilites character

### ** Examples

cities <- c("S\u00e3o Paulo", "Reykjav\u00edk")
print(cities)
ASCIIfy(cities, 1)
ASCIIfy(cities, 2)

athens <- "\u0391\u03b8\u03ae\u03bd\u03b1"
print(athens)
ASCIIfy(athens)



