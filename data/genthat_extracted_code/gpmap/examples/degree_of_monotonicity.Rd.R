library(gpmap)


### Name: degree_of_monotonicity
### Title: Degree of monotonicity of GP map
### Aliases: degree_of_monotonicity degree_of_monotonicity_single

### ** Examples

data(GPmaps)

#Additive GP map is monotone 
degree_of_monotonicity(A)

#Pure AxA epistasis map
degree_of_monotonicity(AA)

#two-locus example in Cheverud & Routman (1995)
degree_of_monotonicity(mouseweight)



