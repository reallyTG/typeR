library(vennplot)


### Name: vennplot
### Title: Draw Venn and Euler diagram in 2D or 3D
### Aliases: vennplot

### ** Examples

# 3D Venn plot with arbitray sets
disjoint.combinations = c(A=80, B=50,C=100, D = 100,E = 100,
                          "A&C"=30, "A&D"= 30,"B&E" = 30, "A&E" = 40, h = 40, "B&h" = 10)
ve = vennplot(disjoint.combinations, ThreeD = TRUE)

# data frame
vennplot(disjoint.combinations = sharks, vars = c("Au","USA","Fa","Sex"),
         scaleSearch = "lineSearch", expand = 1.1)




