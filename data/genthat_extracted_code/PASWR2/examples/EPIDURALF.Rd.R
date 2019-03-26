library(PASWR2)


### Name: EPIDURALF
### Title: Traditional Sitting Position Versus Hamstring Stretch Position
### Aliases: EPIDURALF
### Keywords: datasets

### ** Examples

ggplot(data = EPIDURALF, aes(x = treatment, y = oc, fill = treatment)) +
 geom_boxplot() + guides(fill = FALSE) + scale_fill_brewer() + 
 labs(y = "number of obstructive contacts")



