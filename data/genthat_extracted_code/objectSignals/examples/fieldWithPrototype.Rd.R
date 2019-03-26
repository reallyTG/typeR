library(objectSignals)


### Name: fieldWithPrototype
### Title: Fields with prototypes
### Aliases: fieldWithPrototype

### ** Examples
Brush.gen <- setRefClass("Brush",
fields = fieldWithPrototype("color", "character", "red"))
brush <- Brush.gen$new()
brush$color
brush$color <- "blue"
brush$color


