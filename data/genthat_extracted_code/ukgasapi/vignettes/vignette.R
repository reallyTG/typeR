## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ukgasapi)

## ---- results='hide'-----------------------------------------------------
response <- dataItemExplorer(dataitems = c("Storage Injection, Actual",
                                           "Storage Withdrawal, Actual"),
                             fromdate = "2017-01-01",
                             todate = "2017-12-31")
head(response, 10)

## ----echo=FALSE,results='asis'-------------------------------------------
knitr::kable(head(response,10))

## ----echo=TRUE,results='asis',fig.show='hold'----------------------------
library(ggplot2)
qplot(x = ApplicableFor,
      y = Value,
      data = response,
      colour = PublicationObjectName,
      geom = "line") + 
  theme(legend.position = "bottom")

