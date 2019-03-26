library(walkalytics)


### Name: save_png
### Title: Save a base64-encoded PNG to file
### Aliases: save_png

### ** Examples

## No test: 
isochrone_png(x = 896488, y = 6006502, key = "abcd1234") %>%
    save_png(tempfile(pattern = "file", fileext = ".png"))
## End(No test)



