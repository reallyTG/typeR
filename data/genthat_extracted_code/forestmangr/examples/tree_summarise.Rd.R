library(forestmangr)


### Name: tree_summarise
### Title: Calculate the equivalent diameter of trees with more than one
###   trunk
### Aliases: tree_summarise

### ** Examples


library(forestmangr)
data("exfm18")
exfm18

# Calculate the equivalent diameter of trees with more than one trunk:
eq_diam <- tree_summarise(exfm18, "DBH",tree="Tree", .groups=c("Plot", "Species") )
head(eq_diam, 10)




