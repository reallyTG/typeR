library(clickR)


### Name: GK_assoc
### Title: Computes Goodman and Kruskal's tau
### Aliases: GK_assoc

### ** Examples

data(infert)
GK_assoc(infert$education, infert$case)
GK_assoc(infert$case, infert$education) #Not the same



