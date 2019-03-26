library(ODEsensitivity)


### Name: tdcc
### Title: A Measure of Top-Down Correlation
### Aliases: tdcc

### ** Examples

# b=2 sensitivity analysis techniques A and B that rate the influence of 
# k=20 variables/ input parameters (example taken from Iman and Conover, 1987):
ranking <- rbind(A = 1:20,
                 B = c(1,3,2,4,16,10,19,12,18,17,
                       20,5,14,7,8,11,6,15,9,13))
tdcc(ranking, pearson = TRUE, plot = TRUE)




