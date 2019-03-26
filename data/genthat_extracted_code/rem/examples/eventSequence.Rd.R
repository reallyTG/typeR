library(rem)


### Name: eventSequence
### Title: Create event sequence
### Aliases: eventSequence event.sequence 'event sequence'

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

# combine them into a data.frame
dt <- data.frame(sender, target, time)

# create continuous event sequence: return the data with the 
# event sequence and sort the data according to the event sequence.
dt <- eventSequence(datevar = dt$time, dateformat = '%y%m%d', 
                    data = dt, type = 'continuous', 
                    byTime = 'daily', returnData = TRUE,
                    sortData = TRUE)

# alternative : create variable with the continuous event 
# sequence, unsorted
dt$eventSeq <- eventSequence(datevar = dt$time, 
                             dateformat = '%y%m%d', 
                             data = dt, type = 'continuous',
                             byTime = 'daily', 
                             returnData = FALSE, 
                             sortData = FALSE)
# manually sort the data set
dt <- dt[order(dt$eventSeq), ]

# create the sequence by month
dt$eventSeqMonthly <- eventSequence(datevar = dt$time, 
                                    dateformat = '%y%m%d', 
                                    data = dt, 
                                    type = 'continuous', 
                                    byTime = 'monthly', 
                                    returnData = FALSE, 
                                    sortData = FALSE)

# create the sequence by year
dt$eventSeqYearly <- eventSequence(datevar = dt$time, 
                                   dateformat = '%y%m%d', 
                                   data = dt, 
                                   type = 'continuous', 
                                   byTime = 'yearly', 
                                   returnData = FALSE, 
                                   sortData = FALSE)

# create an ordinal event sequence
dt$eventSeqOrdinal <- eventSequence(datevar = dt$time, 
                                    dateformat = '%y%m%d', 
                                    data = dt, 
                                    type = 'ordinal', 
                                    byTime = 'daily', 
                                    returnData = FALSE, 
                                    sortData = FALSE)

# exclude certain dates
dt$eventSeqEx <- eventSequence(datevar = dt$time,
                               dateformat = '%y%m%d', 
                               data = dt, type = 'continuous',
                               byTime = 'daily', 
                               excludeDate = c('800108', '800112'),
                               returnData = FALSE, 
                               sortData = FALSE)

# return the sequence data set, where all values in the event sequence
# correspond to the date of the events. Useful to calculate
# start-variables for the createRemDataset-command.
seq.data <- eventSequence(datevar = dt$time,
                          dateformat = "%y%m%d", 
                          data = dt, type = "continuous",
                          byTime = "daily", 
                          excludeDate = c("800108", "800112"),
                          returnData = FALSE, 
                          sortData = FALSE, 
                          returnDateSequenceData = TRUE)



