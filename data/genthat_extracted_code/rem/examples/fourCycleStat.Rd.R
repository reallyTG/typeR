library(rem)


### Name: fourCycleStat
### Title: Calculate four cycle statistics
### Aliases: fourCycleStat fourCycle

### ** Examples

# create some data two-mode network event sequence data with
# a 'sender', 'target' and a 'time'-variable
sender <- c('A', 'B', 'A', 'C', 'A', 'D', 'F', 'G', 'A', 'B',
            'B', 'C', 'D', 'E', 'F', 'B', 'C', 'D', 'E', 'C', 
            'A', 'F', 'E', 'B', 'C', 'E', 'D', 'G', 'A', 'G', 
            'F', 'B', 'C')
target <- c('T1', 'T2', 'T3', 'T2', 'T1', 'T4', 'T6', 'T2', 
            'T4', 'T5', 'T5', 'T5', 'T1', 'T6', 'T7', 'T2', 
            'T3', 'T1', 'T1', 'T4', 'T5', 'T6', 'T8', 'T2',
            'T7', 'T1', 'T6', 'T7', 'T3', 'T4', 'T7', 'T8', 'T2')
time <- c('03.01.15', '04.01.15', '10.02.15', '28.02.15', '01.03.15', 
          '07.03.15', '07.03.15', '12.03.15', '04.04.15', '28.04.15',
          '06.05.15', '11.05.15', '13.05.15', '17.05.15', '22.05.15', 
          '09.08.15', '09.08.15', '14.08.15', '16.08.15', '29.08.15',
          '05.09.15', '25.09.15', '02.10.15', '03.10.15', '11.10.15', 
          '18.10.15', '20.10.15', '28.10.15', '04.11.15', '09.11.15', 
          '10.12.15', '11.12.15', '12.12.15')
type <- sample(c('con', 'pro'), 33, replace = TRUE)
important <- sample(c('important', 'not important'), 33,
                    replace = TRUE)

# combine them into a data.frame
dt <- data.frame(sender, target, time, type, important)

# create event sequence and order the data
dt <- eventSequence(datevar = dt$time, dateformat = '%d.%m.%y', 
                    data = dt, type = 'continuous', 
                    byTime = "daily", returnData = TRUE,
                    sortData = TRUE)

# create counting process data set (with null-events) - conditional logit setting
dts <- createRemDataset(dt, dt$sender, dt$target, dt$event.seq.cont, 
                          eventAttribute = dt$type, 
                          atEventTimesOnly = TRUE, untilEventOccurrs = TRUE, 
						  returnInputData = TRUE)
## divide up the results: counting process data = 1, original data = 2
dtrem <- dts[[1]]
dt <- dts[[2]]
## merge all necessary event attribute variables back in
dtrem$type <- dt$type[match(dtrem$eventID, dt$eventID)]
dtrem$important <- dt$important[match(dtrem$eventID, dt$eventID)]
# manually sort the data set
dtrem <- dtrem[order(dtrem$eventTime), ]

# calculate closing four-cycle statistic
dtrem$fourCycle <- fourCycleStat(data = dtrem, 
                              time = dtrem$eventTime, 
                              sender = dtrem$sender, 
                              target = dtrem$target, 
                              eventvar = dtrem$eventDummy,
                              halflife = 20)

# plot closing four-cycles over time:
library("ggplot2")
ggplot(dtrem, aes (eventTime, fourCycle,
                group = factor(eventDummy), color = factor(eventDummy)) ) +
  geom_point()+ geom_smooth() 

# calculate positive closing four-cycles: general support
dtrem$fourCycle.pos <- fourCycleStat(data = dtrem, 
                                 time = dtrem$eventTime, 
                                 sender = dtrem$sender, 
                                 target = dtrem$target, 
                                 eventvar = dtrem$eventDummy,
                                 eventtypevar = dtrem$type, 
                                 eventtypevalue = 'positive',
                                 halflife = 20)

# calculate negative closing four-cycles: general opposition
dtrem$fourCycle.neg <- fourCycleStat(data = dtrem, 
                                     time = dtrem$eventTime, 
                                     sender = dtrem$sender, 
                                     target = dtrem$target, 
                                     eventvar = dtrem$eventDummy,
                                     eventtypevar = dtrem$type, 
                                     eventtypevalue = 'negative',
                                     halflife = 20)



