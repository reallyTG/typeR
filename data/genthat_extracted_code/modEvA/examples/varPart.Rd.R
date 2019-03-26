library(modEvA)


### Name: varPart
### Title: Variation partitioning
### Aliases: varPart

### ** Examples

# if you have a linear model (LM), use (non-adjusted) R-squared values 
# for each factor and for their combinations as inputs:

varPart(A = 0.456, B = 0.315, C = 0.281, AB = 0.051, BC = 0.444, 
AC = 0.569, ABC = 0.624, A.name = "Spatial", B.name = "Human", 
C.name = "Environmental", main = "Small whale")


# if you have a generalized linear model (GLM), 
# you can use squared correlation coefficients 
# of the predictions of each factor with those of the complete model:

varPart(A = (-0.005)^2, B = 0.698^2, C = 0.922^2, AB = 0.696^2, 
BC = 0.994^2, AC = 0.953^2, ABC = 1, A.name = "Topographic", 
B.name = "Climatic", C.name = "Geographic", main = "Big bird")

# but "Unexplained variation" can be deceiving in these cases (see Details)
# try also adding 'plot.unexpl = FALSE'



