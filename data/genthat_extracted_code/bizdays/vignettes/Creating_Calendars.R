## ---- echo=FALSE, message=FALSE------------------------------------------
library(bizdays)
holidays <- holidaysANBIMA

## ---- message=FALSE------------------------------------------------------
create.calendar(name='MyCalendar', holidays=holidays, weekdays=c('sunday', 'saturday'),
                adjust.from=adjust.next, adjust.to=adjust.previous)

## ------------------------------------------------------------------------
is.bizday('2016-07-12', 'MyCalendar')
following('2016-09-07', 'MyCalendar')
bizdays('2016-07-12', '2016-10-16', 'MyCalendar')

## ------------------------------------------------------------------------
cal <- create.calendar(name='MyCalendar', holidays=holidays, weekdays=c('sunday', 'saturday'),
                       adjust.from=adjust.next, adjust.to=adjust.previous)
is.bizday('2016-07-12', cal)

## ---- message=FALSE------------------------------------------------------
create.calendar(name='WeekendsOnly', weekdays=c('sunday', 'saturday'))

## ------------------------------------------------------------------------
from_dates <- '2013-01-01'
to_dates <- seq(as.Date('2013-12-31'), as.Date('2020-12-31'), by='years')
bizdays(from_dates, to_dates, 'WeekendsOnly')

## ------------------------------------------------------------------------
create.calendar(name='EveryMonday', weekdays='monday')
from_dates <- '2013-01-01'
to_dates <- seq(as.Date('2013-12-31'), as.Date('2020-12-31'), by='years')
bizdays(from_dates, to_dates, 'EveryMonday')

## ------------------------------------------------------------------------
create.calendar(name='Actual')
from_dates <- '2013-01-01'
to_dates <- seq(as.Date('2013-12-31'), as.Date('2020-12-31'), by='years')
bizdays(from_dates, to_dates, 'Actual')

