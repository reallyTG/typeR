library(focusedMDS)


### Name: focusedMDS
### Title: Focused, interactive multidimensional scaling
### Aliases: focusedMDS

### ** Examples

# See http://lea-urpa.github.io/focusedMDS.html for 
# an illustrated version of this example.

library(datasets)
library(focusedMDS)

# Load Edgar Anderson's Iris Data
data("iris")

# Create table of measures to compare individuals on
table <- iris[ , c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width")]

# Find euclidean distances based on these measures
dists <- dist(table)

# Simplest usage: only with dataset
focusedMDS(dists)

# Create labels based on flower species
colorvector <- as.vector(iris$Species)

colors <- c("firebrick", "cornflowerblue", "gold")

# Visualization with color labels
focusedMDS(dists, color_cat = colorvector, color_palette = colors )

# Create text labels
table(iris$Species)
names <- c(paste(rep("setosa", 50), 1:50, sep=""),
           paste(rep("versicolor", 50), 1:50, sep=""),
           paste(rep("virginica", 50), 1:50, sep=""))

focusedMDS(dists, ids = names, color_cat = colorvector, color_palette = colors)






