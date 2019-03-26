library(rijkspalette)


### Name: rijksPalette
### Title: Rijkspalette function
### Aliases: rijksPalette

### ** Examples

pal <- rijksPalette("Vermeer Letter")
## No test: 
plot(pal)
barplot(1/sqrt(1:15), col = pal$palette(15))
## End(No test)




