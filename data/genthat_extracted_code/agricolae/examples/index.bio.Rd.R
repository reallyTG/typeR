library(agricolae)


### Name: index.bio
### Title: Biodiversity Index
### Aliases: index.bio
### Keywords: univar

### ** Examples

library(agricolae)
data(paracsho)
# date 22-06-05 and treatment CON = application with insecticide
specimens <- paracsho[1:10,6]
output1 <- index.bio(specimens,method="Simpson.Div",level=95,nboot=100)
output2 <- index.bio(specimens,method="Shannon",level=95,nboot=100)
rbind(output1, output2)



