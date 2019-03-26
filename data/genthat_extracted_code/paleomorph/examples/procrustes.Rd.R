library(paleomorph)


### Name: procrustes
### Title: Conducts Procrustes superimposition to align 3D shapes with or
###   without scaling to centroid size.
### Aliases: procrustes

### ** Examples

# Make an array with 6 specimens and 20 landmarks
A <- array(rep(rnorm(6 * 20, sd = 20), each = 6) + rnorm(20 * 3 * 6 ), 
      dim = c(20, 3, 6))

# Align the data (although it is already largely aligned)
aligned <- procrustes(A)

plotSpecimens(aligned)







