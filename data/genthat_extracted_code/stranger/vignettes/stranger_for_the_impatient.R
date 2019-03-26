## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,  
                      fig.width=10 ,
                      fig.height=7,
                      out.width='100%',
                      dpi=100)
library(knitr)
library(dplyr)
library(ggplot2)
suppressMessages(library(stranger)) 
library(tidyr)

## ----eval=FALSE----------------------------------------------------------
#  library(stranger)

## ----anom1, warning=FALSE------------------------------------------------
anomalies <- iris %>% lucky_odds(n.anom=6, weird="knn", analysis.drop="Species")

anomalies %>% ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species,size=flag_anomaly))+
  geom_point()+
  scale_size_discrete(range=c(1,3))

## ----fullprocess1, warning=FALSE-----------------------------------------

iris %>% select(-Species) %>%       # remove Species - meaningless to define anomalies
  crazyfy() %>%                     # data preparation: add id, rescale [0,1], eventualy takes log
  strange("knn",k=5) %>%            # computes knn distances to 5 neighbors, aggregate distances with the mean (default) 
  singularize() %>%                 # required step if no manual selection
  get_anomalies(nmin=6,nmax=10) %>%  # ask for some anomalies
  fortify(data=iris,colname="anomaly") %>%          # enrich iris dataset with a flag called "anomaly" (0/1)
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species,size=anomaly))+   # let's view!
    geom_point()+
    scale_size_discrete(range=c(1,3))

## ------------------------------------------------------------------------
is <- iris %>% 
   select(-Species) %>%
   crazyfy() %>%
   strange() 

## ------------------------------------------------------------------------
is %>%   plot(type="cluster",score = "knn_k_10_mean")

## ------------------------------------------------------------------------
is %>% plot (type="cluster",
id = ".id",
score = "knn_k_10_mean")

## ------------------------------------------------------------------------
is %>% plot (type="neighbours",score = "knn_k_10_mean")

## ------------------------------------------------------------------------
is %>% plot(type="regression_tree",score = "knn_k_10_mean")

## ------------------------------------------------------------------------
is %>% plot (type="feature_importance",score = "knn_k_10_mean")

## ------------------------------------------------------------------------
is %>% plot(type="scores_decline",score = "knn_k_10_mean")

