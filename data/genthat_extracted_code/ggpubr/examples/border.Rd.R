library(ggpubr)


### Name: border
### Title: Set ggplot Panel Border Line
### Aliases: border

### ** Examples

# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot
p <- ggboxplot(df, x = "dose", y = "len")
p

# Add border
p + border()



