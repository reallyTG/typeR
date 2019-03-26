library(NetworkInference)


### Name: plot.cascade
### Title: Plot a cascade object
### Aliases: plot.cascade

### ** Examples


data(cascades)
plot(cascades, selection = names(cascades$cascade_nodes)[1:5])
plot(cascades, label_nodes = FALSE, selection = sample(1:54, 20))

# Modify resulting ggplot object
library(ggplot2) 
p <- plot(cascades, label_nodes = FALSE, selection = sample(1:54, 20))
## Add a title
p <- p + ggtitle('Your Title')
p
## Change Axis
p <- p + xlab("Your modified y axis label") #x and y labels are flipped here
p <- p + ylab("Your modified x axis label") #x and y labels are flipped here
p




