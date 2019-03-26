library(rem)


### Name: triadStat
### Title: Calculate triad statistics
### Aliases: triadStat triad

### ** Examples

# create some data with 'sender', 'target' and a 'time'-variable
# (Note: Data used here are random events from the Correlates of War Project)
sender <- c('TUN', 'UNK', 'NIR', 'TUR', 'TUR', 'USA', 'URU', 
            'IRQ', 'MOR', 'BEL', 'EEC', 'USA', 'IRN', 'IRN', 
            'USA', 'AFG', 'ETH', 'USA', 'SAU', 'IRN', 'IRN',
            'ROM', 'USA', 'USA', 'PAN', 'USA', 'USA', 'YEM', 
            'SYR', 'AFG', 'NAT', 'UNK', 'IRN')
target <- c('BNG', 'RUS', 'JAM', 'SAU', 'MOM', 'CHN', 'IRQ', 
            'AFG', 'AFG', 'EEC', 'BEL', 'ITA', 'RUS', 'UNK',
            'IRN', 'RUS', 'AFG', 'ISR', 'ARB', 'USA', 'USA',
            'USA', 'AFG', 'IRN', 'IRN', 'IRN', 'AFG', 'PAL',
            'ARB', 'USA', 'EEC', 'IRN', 'CHN')
time <- c('800107', '800107', '800107', '800109', '800109', 
          '800109', '800111', '800111', '800111', '800113',
          '800113', '800113', '800114', '800114', '800114', 
          '800116', '800116', '800116', '800119', '800119',
          '800119', '800122', '800122', '800122', '800124', 
          '800125', '800125', '800127', '800127', '800127', 
          '800204', '800204', '800204')
type <- sample(c('cooperation', 'conflict'), 33,
               replace = TRUE)
important <- sample(c('important', 'not important'), 33,
                    replace = TRUE)

# combine them into a data.frame
dt <- data.frame(sender, target, time, type, important)

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
dtrem <- dts[[1]]
dt <- dts[[2]]
# manually sort the data set
dtrem <- dtrem[order(dtrem$eventTime), ]
# merge type-variable back in
dtrem$type <- dt$type[match(dtrem$eventID, dt$eventID)]

# calculate triad statistic
dtrem$triad <- triadStat(data = dtrem, time = dtrem$eventTime, 
                      sender = dtrem$sender, target = dtrem$target, 
                      eventvar = dtrem$eventDummy,
                      halflife = 2)

# calculate friend-of-friend statistic
dtrem$triad.fof <- triadStat(data = dtrem, time = dtrem$eventTime, 
                          sender = dtrem$sender, target = dtrem$target, 
                          halflife = 2, eventtypevar = dtrem$type, 
                          eventtypevalues = c("cooperation",
                                              "cooperation"), 
                          eventvar = dtrem$eventDummy)

# calculate friend-of-enemy statistic
dtrem$triad.foe <- triadStat(data = dtrem, time = dtrem$eventTime, 
                             sender = dtrem$sender, target = dtrem$target, 
                             halflife = 2, eventtypevar = dtrem$type, 
                             eventtypevalues = c("conflict",
                                                 "cooperation"), 
                             eventvar = dtrem$eventDummy)

# calculate enemy-of-friend statistic
dtrem$triad.eof <- triadStat(data = dtrem, time = dtrem$eventTime, 
                             sender = dtrem$sender, target = dtrem$target, 
                             halflife = 2, eventtypevar = dtrem$type, 
                             eventtypevalues = c("cooperation",
                                                 "conflict"), 
                             eventvar = dtrem$eventDummy)

# calculate enemy-of-enemy statistic
dtrem$triad.eoe <- triadStat(data = dtrem, time = dtrem$eventTime, 
                             sender = dtrem$sender, target = dtrem$target, 
                             halflife = 2, eventtypevar = dtrem$type, 
                             eventtypevalues = c("conflict",
                                                 "conflict"), 
                             eventvar = dtrem$eventDummy)



