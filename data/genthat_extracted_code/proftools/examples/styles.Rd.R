library(proftools)


### Name: styles
### Title: Style Specifications for Call Graphs
### Aliases: plain.style google.style
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
plotProfileCallGraph(pd, style = plain.style)
plotProfileCallGraph(pd, style = google.style)



