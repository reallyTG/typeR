## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,  
                      fig.width=10 ,
                      fig.height=7,
                      out.width='100%',
                      dpi=100)
library(knitr)
library(dplyr)
library(ggplot2)
library(stranger)
library(tidyr)

## ---- echo=FALSE---------------------------------------------------------
w=weirds_list()$detail
kable(w[,c(1:4,6,9)],row.names = FALSE)

## ------------------------------------------------------------------------
anoplot <- function(data,title=NULL){ 
  g <- ggplot(data, aes(x=Sepal.Length,y=Sepal.Width,color=Species,size=flag_anomaly))+geom_point()+scale_size_discrete(range=c(1,3))
  if (!is.null(title)) g <- g+ ggtitle(title)
  return(g)
  }

## ---- echo=FALSE, include=FALSE------------------------------------------
infow <- function(method){ 
  iw=get(paste("weird",method,sep="_"))(info=TRUE)
  cat(paste0("*** weird method ",iw$weird_method))
  cat(paste0("\n",iw$name, " based on function ",iw$foo, " [",iw$package,"]" ))
  cat(paste0("\n","Metric: " ,iw$detail, " sorted in ", ifelse(iw$sort==1,"increasing","decreasing"), " order."))
}

## ---- echo=FALSE---------------------------------------------------------
infow("abod")

## ---- eval=FALSE---------------------------------------------------------
#  iris %>%
#    lucky_odds(n.anom=6, analysis.drop="Species", weird="abod") %>%
#    anoplot(title="abod - default parameters")
#  

## ---- echo=FALSE---------------------------------------------------------
infow("autoencode")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="autoencode") %>%
  anoplot(title="autoencode - default parameters")
 

## ------------------------------------------------------------------------
iris %>%
  lucky_odds(n.anom=6, analysis.drop="Species", weird="autoencode",nl=4, N.hidden=c(10,8),beta=6) %>%
  anoplot(title="autoencode - change network layers strucure")

## ---- echo=FALSE---------------------------------------------------------
infow("isofor")

## ---- eval=FALSE---------------------------------------------------------
#  iris %>%
#    lucky_odds(n.anom=6, analysis.drop="Species", weird="isofor") %>%
#    anoplot(title="isofor - default parameters")
#  

## ---- echo=FALSE---------------------------------------------------------
infow("kmeans")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="kmeans") %>%
  anoplot(title="kmeans - default parameters")
 

## ------------------------------------------------------------------------

iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="kmeans",type="euclidian",centers=8) %>% 
  anoplot(title="kmeans - euclidean - nclusters (centers)=8")


iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="knn",simplify="median") %>% 
  anoplot(title="knn - k=default (10), simplify=median")

## ---- echo=FALSE---------------------------------------------------------
infow("knn")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="knn") %>%
  anoplot(title="knn - default parameters")
 

## ------------------------------------------------------------------------

iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="knn",k=8) %>% 
  anoplot(title="knn - k=8")


iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="knn",simplify="median") %>% 
  anoplot(title="knn - k=default (10), simplify=median")

## ---- echo=FALSE---------------------------------------------------------
infow("lof")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="lof") %>%
  anoplot(title="lof - default parameters")
 

## ------------------------------------------------------------------------

iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="lof",k=8, search="linear") %>% 
  anoplot(title="lof - k=8 - linear kNN")

## ---- echo=FALSE---------------------------------------------------------
infow("mahalanobis")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="mahalanobis") %>%
  anoplot(title="mahalanobis - default parameters")
 

## ---- echo=FALSE---------------------------------------------------------
infow("pcout")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="pcout") %>%
  anoplot(title="pcout - default parameters")
 

## ------------------------------------------------------------------------

iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="pcout", explvar=0.8, crit.Ml=1, crit.cl=3) %>% 
  anoplot(title="pcout - custom values")

## ---- echo=FALSE---------------------------------------------------------
infow("randomforest")

## ---- eval=TRUE----------------------------------------------------------
iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species", weird="randomforest") %>%
  anoplot(title="randomforest - default parameters")
 

## ------------------------------------------------------------------------

iris %>% 
  lucky_odds(n.anom=6, analysis.drop="Species",weird="randomforest", explvar=0.8, ntree=10,mtry=2) %>% 
  anoplot(title="randomforest - custom values")

