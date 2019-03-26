library(dsr)


### Name: dsrrec
### Title: Compute Directly Standardized Rates for Recurrent Events
### Aliases: dsrrec

### ** Examples

#An example of directly standardized rates for recurrent events

library(frailtypack)
library(dplyr)
library(dsr)
data(readmission)

#Make an individual level dataset with total event counts and total observation times
treadm <- as.data.frame(readmission %>%
                         group_by(id) %>%
                         filter(max(enum)==enum ) %>%
                         mutate(events=enum-1, time=t.stop) %>%
                         select(id, events, time, sex, dukes))

#Make the standard pop
tref <- as.data.frame(treadm %>%
                     group_by(sex) %>%
                     mutate(pop=sum(time)) %>%
                     select(sex, pop) %>%
                     distinct(sex, pop))

#Get directly standardized rates (age-adjusted) for readmissions by Dukes' tumor grade.
analysis <- dsrrec(data=treadm,
                  event=events,
                  fu=time,
                  refdata=tref,
                  subgroup=dukes,
                  sex,
                  mp=1000,
                  decimals=3)



