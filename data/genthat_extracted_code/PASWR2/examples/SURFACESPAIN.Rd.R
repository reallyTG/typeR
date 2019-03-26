library(PASWR2)


### Name: SURFACESPAIN
### Title: Surface Area for Spanish Communities
### Aliases: SURFACESPAIN
### Keywords: datasets

### ** Examples

# Base Graphs
with(data = SURFACESPAIN, barplot(surface, names.arg = community, las = 2))
# ggplot2
ggplot(data = SURFACESPAIN, aes(x = reorder(community, surface), y = surface)) + 
geom_bar(stat = "identity", fill = "yellow", color = "gold") + coord_flip() + 
labs(x = "", y = "squared kilometers")
# Trellis Approach
barchart(community ~ surface, data = SURFACESPAIN)



