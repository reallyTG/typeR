library(rem)


### Name: createRemDataset
### Title: Create REM data set with dynamic risk sets
### Aliases: createRemDataset

### ** Examples

## Example 1: standard conditional logistic set-up
dt <- data.frame(
  sender = c('a', 'c', 'd', 'a', 'a', 'f', 'c'), 
  target = c('b', 'd', 'd', 'b', 'b', 'a', 'd'), 
  eventSequence = c(1, 2, 2, 3, 3, 4, 6)
)
count.data <- createRemDataset(
  data = dt, sender = dt$sender, 
  target = dt$target, eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = NULL, 
  start = NULL, startDate = NULL, 
  end = NULL, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = TRUE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = FALSE, possibleEvents = NULL, 
  returnInputData = FALSE)

## Example 2: add 2 attributes to the event-classification
dt <- data.frame(
  sender = c('a', 'c', 'd', 'a', 'a', 'f', 'c'), 
  target = c('b', 'd', 'd', 'b', 'b', 'a', 'd'), 
  pro.con = c('pro', 'pro', 'con', 'pro', 'con', 'pro', 'pro'),
  attack = c('yes', 'no', 'no', 'yes', 'yes', 'no', 'yes'),
  eventSequence = c(1, 2, 2, 3, 3, 4, 6)
)
count.data <- createRemDataset(
  data = dt, sender = dt$sender, 
  target = dt$target, eventSequence = dt$eventSequence, 
  eventAttribute = paste0(dt$pro.con, dt$attack), time = NULL, 
  start = NULL, startDate = NULL, 
  end = NULL, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = TRUE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = FALSE, possibleEvents = NULL, 
  returnInputData = FALSE)

## Example 3: adding start and end variables
# Note: the start and end variables will be overwritten 
# if there are duplicate events. If you want to 
# keep the strict start and stop values that you set, use
# includeAllPossibleEvents = TRUE and specify a 
# possibleEvents-data set.
# Note 2: if untilEventOccurrs = TRUE and an end
# variable is provided, this end variable is 
# overwritten. Set untilEventOccurrs 0 FALSE and 
# provide the end variable if you want the events 
# possibilities to stop at these exact event times.
dt <- data.frame(
  sender = c('a', 'c', 'd', 'a', 'a', 'f', 'c'), 
  target = c('b', 'd', 'd', 'b', 'b', 'a', 'd'), 
  eventSequence = c(1, 2, 2, 3, 3, 4, 6),
  start = c(0, 0, 1, 1, 1, 3, 3), 
  end = rep(6, 7)
)
count.data <- createRemDataset(
  data = dt, sender = dt$sender, 
  target = dt$target, eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = NULL, 
  start = dt$start, startDate = NULL, 
  end = dt$end, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = TRUE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = FALSE, possibleEvents = NULL, 
  returnInputData = FALSE)

## Example 4: using start (and stop) dates
dt <- data.frame(
  sender = c('a', 'c', 'd', 'a', 'a', 'f', 'c'), 
  target = c('b', 'd', 'd', 'b', 'b', 'a', 'd'), 
  eventSequence = c(1, 2, 2, 3, 3, 4, 6),
  date = c('01.02.1971', rep('02.02.1971', 2), 
rep('03.02.1971', 2), '04.02.1971', '06.02.1971'),
  dateAtRisk = c(rep('21.01.1971', 2), rep('01.02.1971', 5)), 
  dateRiskEnds = rep('01.03.1971', 7)
)
count.data <- createRemDataset(
  data = dt, sender = dt$sender, target = dt$target, 
  eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = dt$date, 
  start = NULL, startDate = dt$dateAtRisk, 
  end = NULL, endDate = NULL, 
  timeformat = '%d.%m.%Y',
  atEventTimesOnly = TRUE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = FALSE, possibleEvents = NULL, 
  returnInputData = FALSE)
# if you want to include null-events at times when no event happened, 
# either see Example 5 or create a start-variable by yourself 
# by using the eventSequence()-command with the option 
# 'returnDateSequenceData = TRUE' in this package. With the
# generated sequence, dates from startDate can be matched
# to the event sequence values (using the match()-command).

## Example 5: using start and stop dates and including 
# possible events whenever no event occurred. 
possible.events <- data.frame(
  sender = c('a', 'c', 'd', 'f'), 
  target = c('b', 'd', 'd', 'a'), 
  start = c(0, 0, 1, 1), 
  end = c(rep(8, 4)))
count.data <- createRemDataset(
  data = dt, sender = dt$sender, target = dt$target, 
  eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = NULL, 
  start = NULL, startDate = NULL, 
  end = NULL, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = TRUE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = TRUE, possibleEvents = possible.events, 
  returnInputData = FALSE)
# now you can set 'atEventTimesOnly = FALSE' to include 
# null-events where none occurred until the events happened
count.data <- createRemDataset(
  data = dt, sender = dt$sender, target = dt$target, 
  eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = NULL, 
  start = NULL, startDate = NULL, 
  end = NULL, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = FALSE, untilEventOccurrs = TRUE,
  includeAllPossibleEvents = TRUE, possibleEvents = possible.events, 
  returnInputData = FALSE)
# plus you can set  to get the full range of the events 
# (bounded by max(possible.events$end))
count.data <- createRemDataset(
  data = dt, sender = dt$sender, target = dt$target, 
  eventSequence = dt$eventSequence, 
  eventAttribute = NULL, time = NULL, 
  start = NULL, startDate = NULL, 
  end = NULL, endDate = NULL, 
  timeformat = NULL,
  atEventTimesOnly = FALSE, untilEventOccurrs = FALSE,
  includeAllPossibleEvents = TRUE, possibleEvents = possible.events, 
  returnInputData = FALSE)



