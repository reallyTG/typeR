library(ggpubr)


### Name: bgcolor
### Title: Change ggplot Panel Background Color
### Aliases: bgcolor

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
p <- ggboxplot(df, x = "dose", y = "len")
p

# Change panel background color
p +
  bgcolor("#BFD5E3")+
  border("#BFD5E3")



