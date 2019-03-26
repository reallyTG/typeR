library(ggpubr)


### Name: font
### Title: Change the Appearance of Titles and Axis Labels
### Aliases: font

### ** Examples

# Load data
data("ToothGrowth")

# Basic plot
p <- ggboxplot(ToothGrowth, x = "dose", y = "len", color = "dose",
              title = "Box Plot created with ggpubr",
              subtitle = "Length by dose",
              caption = "Source: ggpubr",
              xlab ="Dose (mg)", ylab = "Teeth length")
p

# Change the appearance of titles and labels
p +
 font("title", size = 14, color = "red", face = "bold.italic")+
 font("subtitle", size = 10, color = "orange")+
 font("caption", size = 10, color = "orange")+
 font("xlab", size = 12, color = "blue")+
 font("ylab", size = 12, color = "#993333")+
 font("xy.text", size = 12, color = "gray", face = "bold")

# Change the appearance of legend title and texts
p +
 font("legend.title", color = "blue", face = "bold")+
 font("legend.text", color = "red")




