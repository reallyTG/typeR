library(datetime)


### Name: c.timeline
### Title: Support for timepoint Classes
### Aliases: c.timeline [.timeline [<-.timepoint [[.timeline
###   as.character.timepoint as.chartime.numeric as.chartime
###   as.numeric.chartime print.timepoint seq.timeline rep.timeline
### Keywords: manip

### ** Examples


#as.data.frame
data.frame(
	dt=as.datetime(seq(from=0,by=86500,length.out=3)),
	d=as.date(seq(from=0,by=86400,length.out=3)),
	t=as.time(c(60,120,180))
)
#                  dt          d     t
# 1  1970-01-01 00:00 1970-01-01 00:01
# 2 1970-01-02 00:01+ 1970-01-02 00:02
# 3 1970-01-03 00:03+ 1970-01-03 00:03

#combine
c(as.time(0),as.time(60))
# 00:00 00:01
c(as.date(0),as.date(86400))
# 1970-01-01 1970-01-02
c(as.datetime(0),as.datetime(86500))
# 1970-01-01T00:00  1970-01-02T00:01+

#subset
as.time(c('08:00','09:00'))[2]
# 09:00
as.date(c('2008-01-01','2008-01-04'))[2]
# 2008-01-04
as.datetime(c('2008-01-01T12:00','2008-01-04T12:30'))[2]
# 2008-01-04 12:30

#element selection
as.time(c('08:00','09:00'))[[2]]
# 09:00
as.date(c('2008-01-01','2008-01-04'))[[2]]
# 2008-01-04
as.datetime(c('2008-01-01T12:00','2008-01-04T12:30'))[[2]]
# 2008-01-04 12:30

#assignment
a <- as.time(seq(60,300, by=60))
a#00:01 00:02 00:03 00:04 00:05
a[5] <- 60
a#00:01 00:02 00:03 00:04 00:01
a[3] <- NA
a#00:01 00:02 <NA>  00:04 00:01

#identity
as.time(as.time(0))
# 00:00
as.date(as.date(0))
# 1970-01-01
as.datetime(as.datetime(0))
# 1970-01-01T00:00

#repetition
rep(as.time(86340),2)
# 23:59 23:59

#sequence
seq(from=as.time('00:00'),length.out=3)
seq(from=as.time('00:00'),by=as.time('00:05'),length.out=3)
seq(from=as.time('00:00'),by=as.time('00:05'),along.with=integer(3))
seq(from=as.time('00:00'),to=as.time('06:00'))
seq(from=as.time('00:00'),to=as.time('06:00'),by=as.time('02:00'))
seq(from=as.time('00:00'),to=as.time('06:00'),length.out=4)




