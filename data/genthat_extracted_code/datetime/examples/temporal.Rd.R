library(datetime)


### Name: timepoint
### Title: Temporal Classes with Selective Defaults
### Aliases: timepoint as.time as.time.character as.time.numeric
###   as.time.time as.date.character as.date as.date.numeric as.date.date
###   as.date.sasdate as.datetime as.datetime.character as.datetime.numeric
###   as.datetime.date as.datetime.datetime format.time format.date
###   format.datetime xtfrm.timepoint as.date.Date as.date.dates
###   as.datetime.POSIXct as.datetime.POSIXlt as.datetime.chron
###   as.time.times unique.timepoint Summary.timepoint datetime date time
###   timeline +.timeline -.timeline
### Keywords: manip

### ** Examples

#numeric to timepoint
as.time(0)
# 00:00
as.time(1)
# 00:00+
as.time(-1)
# 23:59+
as.time(60)
# 00:01
as.time(-60)
# 23:59
as.time(86400)
# 00:00
as.time(86460)
# 00:01
as.date(0)
# 1970-01-01
as.date(1)
# 1970-01-01
as.date(-1)
# 1969-12-31
as.date(-86400)
# 1969-12-31
as.date(-86401)
# 1969-12-30
as.datetime(0)
# 1970-01-01T00:00
as.datetime(60)
# 1970-01-01T00:01
as.datetime(61)
# 1970-01-01T00:01+
as.datetime(-1)
# 1969-12-31T23:59+

#character to timepoint
as.time('00:00')
# 00:00
as.time('23:59')
# 23:59
as.time('23:59:00')
# 23:59
as.time('23:59:01')
# 23:59
as.time('23:59:01',format='%H:%M:%S')
# 23:59+
as.time('24:00')
# 00:00
as.date('1970-01-02')
# 1970-01-02
as.date('01/02/1970',format='%m/%d/%Y')
# 1970-01-02
as.datetime('01/02/1970 12:30',format='%m/%d/%Y %H:%M')
# 1970-01-02 12:30
as.datetime('01/02/1970 12:30:15',format='%m/%d/%Y %H:%M:%S')
# 1970-01-02 12:30+

#timepoint to numeric
as.numeric(as.time(0))
# 0
as.numeric(as.time(1))
# 1
as.numeric(as.time(-1))
# 86399
as.numeric(as.time(60))
# 60
as.numeric(as.time(-60))
# 86340
as.numeric(as.time(86400))
# 0
as.numeric(as.time(86460))
# 60
as.numeric(as.date(0))
# 0
as.numeric(as.date(1))
# 0
as.numeric(as.date(-1))
# -86400
as.numeric(as.date(-86400))
# -86400
as.numeric(as.date(-86401))
# -172800
as.numeric(as.datetime(0))
# 0
as.numeric(as.datetime(60))
# 60
as.numeric(as.datetime(61))
# 61
as.numeric(as.datetime(-1))
# -1
as.numeric(as.time('00:00'))
# 0
as.numeric(as.time('23:59'))
# 86340
as.numeric(as.time('23:59:00'))
# 86340
as.numeric(as.time('23:59:01'))
# 86340
as.numeric(as.time('23:59:01',format='%H:%M:%S'))
# 86341
as.numeric(as.time('24:00'))
# 0
as.numeric(as.date('1970-01-02'))
# 86400
as.numeric(as.date('01/02/1970',format='%m/%d/%Y'))
# 86400
as.numeric(as.datetime('01/02/1970 12:30',format='%m/%d/%Y %H:%M'))
# 131400
as.numeric(as.datetime('01/02/1970 12:30:15',format='%m/%d/%Y %H:%M:%S'))
# 131415

#timepoint to character
as.character(as.time(0))
# '00:00'
as.character(as.date(0))
# '1970-01-01'
as.character(as.datetime(0))
# '1970-01-01T00:00'

#non-default printout
format(as.time(30000),format='%H')
# '08'
format(as.date('1970-01-01'),format='%d%b%y')
# '01Jan70'
format(as.datetime('1970-01-02T23:30'),format='[%d/%m/%y %H:%M:%S]')
# '[02/01/70 23:30:00]'
format(as.time(1))
# '00:00+'
format(as.time(1),mark=FALSE)
# '00:00'

#sequence
seq(from=as.time('8:00'),to=as.time('12:00'))
# 08:00 09:00 10:00 11:00 12:00
seq(from=as.date('2008-01-01'),to=as.date('2008-01-04'))
# 2008-01-01 2008-01-02 2008-01-03 2008-01-04
seq(from=as.datetime('2008-01-01T12:00'),to=as.datetime('2008-01-04T12:30'))
# 2008-01-01 12:00 2008-01-02 12:00 2008-01-03 12:00 2008-01-04 12:00

#interconversion
as.time(as.date('2008-10-14'))
# 00:00
as.time(as.datetime('2008-10-14T08:00'))
# 08:00
as.date(as.time('23:59'))
# 1970-01-01
as.date(as.datetime('2008-10-14T08:00'))
# 2008-10-14
as.datetime(as.time(6000000))
# 1970-01-01T10:40
as.datetime(as.date('2008-10-14'))
# 2008-10-14 00:00
as.datetime(as.date('2008-10-14'),y=as.time('00:30'))
# 2008-10-14 00:30

#intercoversion from other systems
as.date(as.Date('1970-01-01'))
# 1970-01-01
as.datetime(as.POSIXct('1970-01-01',tz='GMT'))
# 1970-01-01T00:00
as.datetime(as.POSIXlt('1970-01-01',tz='GMT'))
# 1970-01-01T00:00
if(require(chron)) as.time(times('12:30:00'))
# 12:30
as.date(dates('01/01/1970'))
# 1970-01-01
if(require(chron))as.datetime(chron(dates='01/01/1970',times='12:30:00'))
# 1970-01-01T12:30
as.date.sasdate(0)
# 1960-01-01
as.time(as.numeric(NA))
# <NA>

#infinity
as.time(Inf)
# Inf
as.date(Inf)
# Inf
as.datetime(Inf)
# Inf
as.time(-Inf)
# -Inf
as.datetime(Inf) + (Inf)
# Inf
as.datetime(Inf) + (-Inf)
# <NA>

#comparison
as.time('08:00') < as.time('09:00')
# TRUE
as.date('1970-01-01') > as.date('2008-01-01')
# FALSE
as.datetime('1970-01-01 08:00') > as.date('1970-01-01')
# TRUE

#summary
max(as.date(c('1970-01-01','1980-01-01','1975-01-01')))
# 1980-01-01

#operations
as.datetime(0) + as.second(60)
# 1970-01-01T00:01
as.second(60) + as.datetime(0)
# 1970-01-01T00:01
try(as.datetime(60) + as.datetime(60))
# Error in `+.timeline`(as.datetime(60), as.datetime(60)) :
#   addition is undefined for two timepoints
as.datetime(0) + 60
# 1970-01-01 00:01
60 + as.datetime(0)
# 1970-01-01T00:01
as.minute(1) + as.datetime(0)
# 1970-01-01T00:01
as.datetime(0) - as.second(60)
# 1969-12-31T23:59
as.datetime(0) - 60
# 1969-12-31T23:59
as.datetime(60) - as.datetime(0)
# 60
try(as.second(60) - as.datetime(60))
# Error in `-.timeline`(as.second(60), as.datetime(60)) :
#   subtracting a timepoint from non-timepoint is undefined
try(60 - as.datetime(60))
# Error in `-.timeline`(as.second(60), as.datetime(60)) :
#   subtracting a timepoint from non-timepoint is undefined
as.second(10) * 6
# 60
as.datetime(0) * 2 # meaningless, but not prevented
# 1970-01-01T00:00

#unary operations
-as.time(1)
# 23:59+
+as.time(1)
# 00:00+

#sorting
sort(unique(as.time(c(180,120,60))))
# 00:01 00:02 00:03



