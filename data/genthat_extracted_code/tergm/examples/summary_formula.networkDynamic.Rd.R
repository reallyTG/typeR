library(tergm)


### Name: summary_formula.networkDynamic
### Title: Calculation of networkDynamic statistics.
### Aliases: summary_formula.networkDynamic summary.formula
### Keywords: models

### ** Examples


# create a toy dynamic network
my.nD <- network.initialize(100,directed=FALSE)
activate.vertices(my.nD, onset=0, terminus = 10)
add.edges.active(my.nD,tail=1:2,head=2:3,onset=5,terminus=8)

# use a summary formula to display number of isolates and edges
# at discrete time points
summary(my.nD~isolates+edges, at=1:10)



