## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE, message=TRUE, warning=TRUE, include=TRUE----------------
#  install.packages("UKgrid")

## ----eval=FALSE, message=TRUE, warning=TRUE, include=TRUE----------------
#  # install.packages("devtools")
#  devtools::install_github("RamiKrispin/UKgrid")

## ------------------------------------------------------------------------
library(UKgrid)

data("UKgrid")

str(UKgrid)

## ----fig.height=5, fig.width=8, message=FALSE, warning=FALSE, paged.print=FALSE----

nd_half_hourly <- extract_grid(type = "xts", # default
                          columns = "ND", # default
                          aggregate = NULL # default
                          )



library(xts)

class(nd_half_hourly)
periodicity(nd_half_hourly)

library(TSstudio)
ts_plot(ts.obj = nd_half_hourly, 
        title = "UK National Demand - Half-Hourly")


## ----fig.height=5, fig.width=8, message=FALSE, warning=FALSE, paged.print=FALSE----

nd_hourly <- extract_grid(type = "ts", 
                          columns = "ND", 
                          aggregate = "hourly" 
                          )

class(nd_hourly)
frequency(nd_hourly)

ts_plot(ts.obj = nd_hourly, 
        title = "UK National Demand - Hourly")


## ----fig.height=5, fig.width=8, message=FALSE, warning=FALSE, paged.print=FALSE----

df <- extract_grid(type = "xts", 
                          columns = c("ND","TSD"), 
                          aggregate = "daily" 
                          )

head(df)

ts_plot(ts.obj = df, 
        title = "UK National and Transmission System Demand - Daily")


## ----fig.height=5, fig.width=8, message=FALSE, warning=FALSE, paged.print=FALSE----

df1 <- extract_grid(type = "zoo", 
                          columns = "ND", 
                          aggregate = "daily", 
                          start = 2015,
                          end = 2017)

head(df1)

ts_plot(ts.obj = df1, 
        title = "UK National and Transmission System Demand - Daily between 2015 and 2017")


