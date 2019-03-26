library(PASWR2)


### Name: WHEATSPAIN
### Title: Wheat Surface Area in Spain
### Aliases: WHEATSPAIN
### Keywords: datasets

### ** Examples

ggplot(data = WHEATSPAIN, aes(x = reorder(community, acres), y = acres)) + 
geom_bar(stat="identity", color = "orange", fill = "gold") + coord_flip() + 
labs(x = "") 



