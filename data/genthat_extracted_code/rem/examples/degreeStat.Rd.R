library(rem)


### Name: degreeStat
### Title: Calculate (in/out)-degree statistics
### Aliases: degreeStat degree outdegree indegree

### ** Examples

# create some data with 'sender', 'target' and a 'time'-variable
# (Note: Data used here are random events from the Correlates of War Project)
sender <- c('TUN', 'NIR', 'NIR', 'TUR', 'TUR', 'USA', 'URU', 
            'IRQ', 'MOR', 'BEL', 'EEC', 'USA', 'IRN', 'IRN', 
            'USA', 'AFG', 'ETH', 'USA', 'SAU', 'IRN', 'IRN',
            'ROM', 'USA', 'USA', 'PAN', 'USA', 'USA', 'YEM', 
            'SYR', 'AFG', 'NAT', 'NAT', 'USA')
target <- c('BNG', 'ZAM', 'JAM', 'SAU', 'MOM', 'CHN', 'IRQ', 
            'AFG', 'AFG', 'EEC', 'BEL', 'ITA', 'RUS', 'UNK',
            'IRN', 'RUS', 'AFG', 'ISR', 'ARB', 'USA', 'USA',
            'USA', 'AFG', 'IRN', 'IRN', 'IRN', 'AFG', 'PAL',
            'ARB', 'USA', 'EEC', 'BEL', 'PAK')
time <- c('800107', '800107', '800107', '800109', '800109', 
          '800109', '800111', '800111', '800111', '800113',
          '800113', '800113', '800114', '800114', '800114', 
          '800116', '800116', '800116', '800119', '800119',
          '800119', '800122', '800122', '800122', '800124', 
          '800125', '800125', '800127', '800127', '800127', 
          '800204', '800204', '800204')
type <- sample(c('cooperation', 'conflict'), 33,
               replace = TRUE)

# combine them into a data.frame
dt <- data.frame(sender, target, time, type)

# create event sequence and order the data
dt <- eventSequence(datevar = dt$time, dateformat = "%y%m%d", 
                    data = dt, type = "continuous", 
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

# calculate sender-outdegree statistic
dtrem$sender.outdegree <- degreeStat(data = dtrem,
                                  time = dtrem$eventTime, 
                                  degreevar = dtrem$sender, 
                                  halflife = 2, 
                                  eventvar = dtrem$eventDummy,
                                  returnData = FALSE)

# plot sender-outdegree over time
library("ggplot2")
ggplot(dtrem, aes(eventTime, sender.outdegree, 
                  group = factor(eventDummy), color = factor(eventDummy) ) ) +
  geom_point()+ geom_smooth() 

# calculate sender-indegree statistic
dtrem$sender.indegree <- degreeStat(data = dtrem,
                                    time = dtrem$eventTime, 
                                    degreevar = dtrem$sender, 
                                    halflife = 2, 
                                    eventvar = dtrem$eventDummy,
                                    degreeOnOtherVar = dtrem$target,
                                    returnData = FALSE)

# calculate target-indegree statistic
dtrem$target.indegree <- degreeStat(data = dtrem,
                                     time = dtrem$eventTime, 
                                     degreevar = dtrem$target, 
                                     halflife = 2, 
                                     eventvar = dtrem$eventDummy,
                                     returnData = FALSE)

# calculate target-outdegree statistic
dtrem$target.outdegree <- degreeStat(data = dtrem,
                                    time = dtrem$eventTime, 
                                    degreevar = dtrem$target, 
                                    halflife = 2, 
                                    eventvar = dtrem$eventDummy,
                                    degreeOnOtherVar = dtrem$sender,
                                    returnData = FALSE)

# calculate target-indegree with typematch
dtrem$target.indegree.tm <- degreeStat(data = dtrem,
                                    time = dtrem$eventTime, 
                                    degreevar = dtrem$target, 
                                    halflife = 2, 
                                    eventtypevar = dtrem$type, 
                                    eventtypevalue = "valuematch",
                                    eventvar = dtrem$eventDummy,
                                    returnData = FALSE)



