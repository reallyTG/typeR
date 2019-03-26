library(COSINE)


### Name: Score_adjust_PPI
### Title: To adjust the score of the selected PPI sub-network using random
###   sampling
### Aliases: Score_adjust_PPI

### ** Examples

data(scaled_node_score)
data(scaled_edge_score)
data(PPI)
data(set1_GA)
adj_Score<-Score_adjust_PPI(scaled_node_score,scaled_edge_score,
PPI,lam=0.1,subnet=set1_GA$Subnet[[1]],num_random_sampling=2,
best_score=set1_GA$Best_Scores[1])




