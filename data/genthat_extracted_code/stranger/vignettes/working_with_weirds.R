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

## ------------------------------------------------------------------------
iris %>% select(-Species) %>%
  crazyfy() %>%
  strange(weird="lof") %>%
  singularize() -> s
anom <- filter(s,lof_k_10>2) %>% as.anomalies()

## ------------------------------------------------------------------------
plot(s,type="neighbours", score="lof_k_10",anomaly_id=anom[1])

## ------------------------------------------------------------------------
tg <- expand.grid(k=c(5,10,20),simplify=c("mean","median"),stringsAsFactors=FALSE)
tg

## ------------------------------------------------------------------------
(anoms.all <-  iris %>% select(-Species) %>%
  crazyfy() %>% strange(weird="knn",tuneGrid=tg))

## ------------------------------------------------------------------------
tg = data.frame(k=c(5,5:8))
(anoms <-  iris %>% select(-Species) %>%
  crazyfy() %>% strange(weird="knn",tuneGrid=tg,algorithm=c("cover_tree")))
(meta  <- get_info(anoms))
meta[,"parameters"]

## ------------------------------------------------------------------------
data <- iris %>% select(-Species) %>% crazyfy()
m1 <- strange(data, weird="knn")
m2 <- strange(data, weird="autoencode")

## ------------------------------------------------------------------------
(metrics <- merge(m1,m2))

## ------------------------------------------------------------------------
s3=stranger(data,
    methodList=c("knn","autoencode"),
    tuneList=list(weird(method="knn",k=20)))

