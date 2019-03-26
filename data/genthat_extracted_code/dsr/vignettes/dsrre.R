## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE----------------------------------------
#load necessary packages
require(frailtypack)
require(dplyr)
data(readmission)

## ----message=FALSE, warning=FALSE----------------------------------------
#Calculate total events and total observation times per person
treadm <- readmission %>%
          group_by(id) %>%
          filter(max(enum)==enum ) %>%
          mutate(events=enum-1,time=t.stop) %>%
          select(id, events, time, sex, dukes)

#View first 6 records
knitr::kable(head(treadm), caption='Person-level Dataset')

## ----message=FALSE, warning=FALSE----------------------------------------
#Make the reference data
tref <- treadm %>% 
        group_by(sex) %>% 
        mutate(pop=sum(time)) %>% 
        select(sex, pop) %>% 
        distinct(sex, pop)


#View
knitr::kable(tref, caption='Reference Dataset')


## ----message=FALSE, warning=FALSE----------------------------------------
require(dsr)

my_analysis <- dsrrec(data=treadm,
                       event=events,
                       fu=time,
                       refdata=tref,
                       subgroup=dukes,
                       sex,
                       sig=0.95,
                       mp=1000,
                       decimals=3)


## ----message=FALSE, warning=FALSE----------------------------------------
knitr::kable(my_analysis, caption='Analysis Results') 


