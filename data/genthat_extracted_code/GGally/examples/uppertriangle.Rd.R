library(GGally)


### Name: uppertriangle
### Title: uppertriangle - rearrange dataset as the preparation of
###   ggscatmat function
### Aliases: uppertriangle

### ** Examples

data(flea)
head(uppertriangle(flea, columns=2:4))
head(uppertriangle(flea))
head(uppertriangle(flea, color="species"))



