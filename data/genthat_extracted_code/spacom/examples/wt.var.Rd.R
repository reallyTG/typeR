library(spacom)


### Name: aggregation functions
### Title: Aggregation functions provided by spacom
### Aliases: wt.var wt.Atkinson wt.RS wt.Theil wt.gini wt.gini.categ
###   wt.mean wt.sd wt.gini.group
### Keywords: spatial

### ** Examples

## Creating indicators of spatially weighted inequalities 

## load individual level data and remove missings
data(traces_ind)
traces_ind <- na.exclude(traces_ind)

## create variable "simulated income" in the dataset
## the variable is created only in demonstrative purposes, 
## and it is not part of the TRACES dataset

traces_ind$sim_inc <- rnorm(nrow(traces_ind), 1000, 100)

## Step 1: Load distance matrix and create weights
data(d_geo)
geow.50 <- WeightMatrix(d_geo, bandwidth=50)

## Step 2: Spatially weighted gini for simulated income
si.gini <- SpawAggregate(contextual.data=traces_ind,
                         context.id="area.name",
                         contextual.names="sim_inc",
                         contextual.weight.matrices=geow.50,
                         aggregation.functions="wt.gini",
                         design.weight.names=NULL,
                         nb.resamples=5)

## Step 2: Spatially weighted gini for groups (Spatially weighted inequalities
## in simulated income for men and women)  

si.gini.gr <- SpawAggregate(contextual.data=traces_ind,
                            context.id="area.name",
                            contextual.names="sim_inc",
                            contextual.weight.matrices=geow.50,
                            aggregation.functions="wt.gini.group",
                            additional.args="male",
                            design.weight.names=NULL,
                            nb.resamples=5)   



