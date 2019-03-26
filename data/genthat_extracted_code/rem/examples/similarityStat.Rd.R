library(rem)


### Name: similarityStat
### Title: Calculate similarity statistics
### Aliases: similarityStat similarity

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
## divide up the results: counting process data = 1, original data = 2
dtrem <- dts[[1]]
dt <- dts[[2]]
## merge all necessary event attribute variables back in
dtrem$type <- dt$type[match(dtrem$eventID, dt$eventID)]
dtrem$important <- dt$important[match(dtrem$eventID, dt$eventID)]
# manually sort the data set
dtrem <- dtrem[order(dtrem$eventTime), ]

# average sender similarity
dtrem$s.sim.av <- similarityStat(data = dtrem, 
                              time = dtrem$eventTime,
                              sender = dtrem$sender, 
                              target = dtrem$target, 
                              eventvar = dtrem$eventDummy,
                              senderOrTarget = "sender", 
                              whichSimilarity = "average")

# average target similarity
dtrem$t.sim.av <- similarityStat(data = dtrem, 
                                 time = dtrem$eventTime,
                                 sender = dtrem$sender, 
                                 target = dtrem$target, 
                                 eventvar = dtrem$eventDummy,
                                 senderOrTarget = "target", 
                                 whichSimilarity = "average")

# Calculate sender similarity with 1 halflife 
# parameter: This parameter makes sure, that those other  
# senders (with whom you compare your targets) have been 
# active in the past. THe longer they've done nothing, the 
# less weight is given to the number of similar targets.
dtrem$s.sim.hl2 <- similarityStat(data = dtrem, 
                                 time = dtrem$eventTime,
                                 sender = dtrem$sender, 
                                 target = dtrem$target, 
                                 eventvar = dtrem$eventDummy,
                                 senderOrTarget = "sender", 
                                 halflifeLastEvent = 2)

# Calculate sender similarity with 2 halflife parameters: 
# The first parameter makes sure that the actors against
# whom you compare yourself have been active in the 
# recent past. The second halflife parameter makes
# sure that the two events containing the same 
# targets (once by the current actor, once by the other 
# actor) are not that far apart. The longer apart, the 
# less likely it is that the current sender will remember
# how the similar-past sender has acted.
dtrem$s.sim.hl2.hl1 <- similarityStat(data = dtrem, 
                                  time = dtrem$eventTime,
                                  sender = dtrem$sender, 
                                  target = dtrem$target, 
                                  eventvar = dtrem$eventDummy,
                                  senderOrTarget = "sender", 
                                  halflifeLastEvent = 2, 
                                  halflifeTimeBetweenEvents = 1)



