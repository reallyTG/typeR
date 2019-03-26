## ------------------------------------------------------------------------
rm(list=ls(all=TRUE))
library(Corbi)
library(Matrix)
options(scipen=0)

## ------------------------------------------------------------------------
net <- read_net("network.txt")

## ------------------------------------------------------------------------
size <- 10

## ------------------------------------------------------------------------
source("search_net.R")
subnet  <- search_net(net, node_size = size, ori_name = TRUE)
deg_list <- as.character(unique(as.vector(subnet)))

## ------------------------------------------------------------------------
deg_list

## ------------------------------------------------------------------------
sample_num <- 50	

## ------------------------------------------------------------------------
disease_num <- 25

## ------------------------------------------------------------------------
library(matrixcalc)
library(MASS)
l <- net$size
p <- length(deg_list)
exp_dataset <- matrix(0, sample_num, l, dimnames = list(paste("sample", 1:sample_num, sep=""), net$node))
vars  <- 1
sigma <- matrix(0)
while(!is.positive.definite(sigma)){
  vars  <- vars + 1
  sigma <- as.matrix(as(net$matrix,'dgCMatrix'))
  sigma[which(sigma == 1)] <- rnorm(length(which(sigma == 1)), 4, 1)
  sigma[which(sigma == 0)] <- rnorm(length(which(sigma == 0)), 2, 1)
  diag(sigma) <- rnorm(l, vars, 1)
  sigma <- (sigma + t(sigma))/2
}
sample_mean <- rnorm(l, 5, 1)
exp_dataset <- mvrnorm(sample_num, sample_mean, sigma)								
exp_dataset[1:disease_num, deg_list] <- exp_dataset[1:disease_num, deg_list] * rnorm(disease_num*p, 2, 0.1)

## ------------------------------------------------------------------------
dim(exp_dataset)

## ------------------------------------------------------------------------
label <- c(rep(0, disease_num), rep(1, sample_num-disease_num))

## ------------------------------------------------------------------------
adj_matrix <- as.matrix(net$matrix)
adj_matrix <- adj_matrix[colnames(exp_dataset), colnames(exp_dataset)]
adj_matrix <- adj_matrix + t(adj_matrix)

## ------------------------------------------------------------------------
time1 <- system.time(
  result1 <- markrank(exp_dataset, label, adj_matrix, alpha=0.8, lambda=0.2, trace=TRUE)
  )

## ------------------------------------------------------------------------
names(result1)

## ------------------------------------------------------------------------
s1 <- sort(result1$score, decreasing=TRUE)
s1[1:10]

## ------------------------------------------------------------------------
result1$score[deg_list]	

## ------------------------------------------------------------------------
setdiff(names(s1[1:10]), deg_list)									

## ------------------------------------------------------------------------
result1$steps									

## ------------------------------------------------------------------------
result1$initial_pars								

## ------------------------------------------------------------------------
NET2 <- result1$NET2			

## ------------------------------------------------------------------------
time2 <- system.time(
  result2 <- markrank(exp_dataset, label, adj_matrix, alpha=0.8, lambda=0.5, trace=FALSE, Given_NET2=NET2)
  )

## ------------------------------------------------------------------------
time1
time2

## ------------------------------------------------------------------------
s2 <- sort(result2$score, decreasing=TRUE)
s2[1:10]

## ------------------------------------------------------------------------
result2$score[deg_list]	

## ------------------------------------------------------------------------
setdiff(names(s2[1:10]), deg_list)									

## ------------------------------------------------------------------------
time3 <- system.time(
  result3 <- markrank(exp_dataset, label, adj_matrix, trace=F, d=2)
  )

## ------------------------------------------------------------------------
time1
time3

## ------------------------------------------------------------------------
result3$dis[1:10,1:10]

