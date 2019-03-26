library(ACSWR)


### Name: adjectives
### Title: A Dataset for Factor Analysis
### Aliases: adjectives
### Keywords: factor analysis

### ** Examples

data(adjectives)
adjectivescor <- cor(adjectives[,-1])
round(adjectivescor,3)
adj_eig <- eigen(adjectivescor)
cumsum(adj_eig$values)/sum(adj_eig$values)
adj_eig$vectors[,1:2]
loadings1 <- adj_eig$vectors[,1]*sqrt(adj_eig$values[1])
loadings2 <- adj_eig$vectors[,2]*sqrt(adj_eig$values[2])
cbind(loadings1,loadings2)
communalities <- (adj_eig$vectors[,1]*sqrt(adj_eig$values[1]))^2+
(adj_eig$vectors[,2]*sqrt(adj_eig$values[2]))^2
round(communalities,3)
specific_variances <- 1-communalities
round(specific_variances,3)
var_acc_factors <- adj_eig$values
round(var_acc_factors,3)
prop_var <- adj_eig$values/sum(adj_eig$values)
round(prop_var,3)
cum_prop <- cumsum(adj_eig$values)/sum(adj_eig$values)
round(cum_prop,3)



