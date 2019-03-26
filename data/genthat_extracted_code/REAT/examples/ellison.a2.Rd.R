library(REAT)


### Name: ellison.a2
### Title: Ellison-Glaeser Agglomeration Index
### Aliases: ellison.a2

### ** Examples

# Example from Farhauer/Kroell (2014):
j <- c("Wien", "Wien", "Wien", "Wien", "Wien", "Linz", 
"Linz", "Linz", "Linz", "Graz")
E_ik <- c(200,650,12000,100,50,16000,13000,1500,1500,25000)
E_j <- c(500000,400000,100000)
ellison.a(E_ik, E_j, j)
# 0.05990628



