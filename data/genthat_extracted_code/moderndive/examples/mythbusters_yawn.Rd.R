library(moderndive)


### Name: mythbusters_yawn
### Title: Data from Mythbusters' study on contagiousness of yawning
### Aliases: mythbusters_yawn
### Keywords: datasets

### ** Examples

library(ggplot2)

# Plot both variables as a stacked proportional bar chart
ggplot(mythbusters_yawn, aes(x = group, fill = yawn)) +
  geom_bar(position = "fill") +
  labs(x = "", y = "Proportion", 
  title = "Proportion of yawn and not yawn for each group")



