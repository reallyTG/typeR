library(PASWR2)


### Name: MILKCARTON
### Title: Milk Carton Drying Times
### Aliases: MILKCARTON
### Keywords: datasets

### ** Examples

ggplot(data = MILKCARTON, aes(x = size, y = seconds)) + geom_boxplot()
ggplot(data = MILKCARTON, aes(x = size, y = seconds, fill = size)) + geom_boxplot() + 
guides(fill = FALSE) + scale_fill_brewer() + 
labs(x = "size of container", y = "drying time in seconds")



