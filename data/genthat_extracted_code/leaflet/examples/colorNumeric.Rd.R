library(leaflet)


### Name: colorNumeric
### Title: Color mapping
### Aliases: colorNumeric colorBin colorQuantile colorFactor

### ** Examples

pal <- colorBin("Greens", domain = 0:100)
pal(runif(10, 60, 100))

## No test: 
 # Exponential distribution, mapped continuously
 previewColors(colorNumeric("Blues", domain = NULL), sort(rexp(16)))
 # Exponential distribution, mapped by interval
 previewColors(colorBin("Blues", domain = NULL, bins = 4), sort(rexp(16)))
 # Exponential distribution, mapped by quantile
 previewColors(colorQuantile("Blues", domain = NULL), sort(rexp(16)))

 # Categorical data; by default, the values being colored span the gamut...
 previewColors(colorFactor("RdYlBu", domain = NULL), LETTERS[1:5])
 # ...unless the data is a factor, without droplevels...
 previewColors(colorFactor("RdYlBu", domain = NULL), factor(LETTERS[1:5], levels = LETTERS))
 # ...or the domain is stated explicitly.
 previewColors(colorFactor("RdYlBu", levels = LETTERS), LETTERS[1:5])
## End(No test)



