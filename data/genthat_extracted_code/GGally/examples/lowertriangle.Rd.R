library(GGally)


### Name: lowertriangle
### Title: lowertriangle - rearrange dataset as the preparation of
###   ggscatmat function
### Aliases: lowertriangle

### ** Examples

data(flea)
head(lowertriangle(flea, columns= 2:4))
head(lowertriangle(flea))
head(lowertriangle(flea, color="species"))



