library(PASWR2)


### Name: WHEATUSA2004
### Title: USA Wheat Surface 2004
### Aliases: WHEATUSA2004
### Keywords: datasets

### ** Examples

ggplot(data = WHEATUSA2004, aes(x = reorder(states, acres), y = acres)) + 
geom_bar(stat = "identity", color = "gold", fill = "yellow") + coord_flip() + 
labs(x = "") 



