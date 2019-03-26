library(urltools)


### Name: url_decode
### Title: Encode or decode a URI
### Aliases: url_decode url_encode

### ** Examples


url_decode("https://en.wikipedia.org/wiki/File:Vice_City_Public_Radio_%28logo%29.jpg")
url_encode("https://en.wikipedia.org/wiki/File:Vice_City_Public_Radio_(logo).jpg")

## Not run: 
##D #A demonstrator of the contrasting behaviours around out-of-range characters
##D URLdecode("%gIL")
##D url_decode("%gIL")
## End(Not run)



