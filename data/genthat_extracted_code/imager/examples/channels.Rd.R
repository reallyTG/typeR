library(imager)


### Name: channels
### Title: Split a colour image into a list of separate channels
### Aliases: channels

### ** Examples

channels(boats)
channels(boats,1:2)
channels(boats,1:2,drop=TRUE) %>% str #A list of 2D arrays



