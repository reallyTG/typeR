library(r.jive)


### Name: jive.predict
### Title: Predict JIVE scores for new data
### Aliases: jive.predict

### ** Examples

##Load data that were simulated as in Section 2.4 of Lock et al., 2013,
##with rank 1 joint structure, and rank 1 individual structure for each dataset
data(SimData) 
##load JIVE results (using default settings) for simulated data 
data(SimResults) 
#predict JIVE scores for data (treated as "new data" here)
pred.results <- jive.predict(SimData,Results) 
##estimated joint structure is pred.results$joint.load %*% pred.results$joint.scores
##estimated individual structure for source i is 
##pred.results$indiv.load[[i]] %*% pred.results$indiv.scores[[i]]



