library(epitools)


### Name: epicurve
### Title: Construct an epidemic curve
### Aliases: epicurve.hours epicurve.dates epicurve.weeks epicurve.months
###   epicurve.table
### Keywords: hplot

### ** Examples

##epicurve.dates
sampdates <- seq(as.Date("2004-07-15"), as.Date("2004-09-15"), 1)
x <- sample(sampdates, 100, rep=TRUE)
xs <- sample(c("Male","Female"), 100, rep=TRUE)
epicurve.dates(x)
epicurve.dates(x, strata = xs)
rr <- epicurve.dates(x, strata = xs, segments = TRUE,
                     axisnames = FALSE)
axis(1, at = rr$xvals, labels = rr$cmday, tick = FALSE, line = 0)
axis(1, at = rr$xvals, labels = rr$cmonth, tick = FALSE, line = 1)

##epicurve.weeks
sampdates <- seq(as.Date("2004-07-15"), as.Date("2004-09-15"), 1)
x <- sample(sampdates, 100, rep=TRUE)
xs <- sample(c("Male","Female"), 100, rep=TRUE)
epicurve.weeks(x)

epicurve.weeks(x, strata = xs)

rr <- epicurve.weeks(x, strata = xs, segments = TRUE)
rr


##epicurve.months
dates <- c("1/1/04", "1/2/04", "1/3/04", "1/4/04", "1/5/04",
"1/6/04", "1/7/04", "1/8/04", "1/9/04", "1/10/04", NA, "1/12/04",
"1/14/04", "3/5/04", "5/5/04", "7/6/04", "8/18/04", "12/13/05",
"1/5/05", "4/6/05", "7/23/05", "10/3/05")
aw <- as.month(dates, format = "%m/%d/%y")
aw
aw2 <- as.month(dates, format = "%m/%d/%y", min.date="2003-01-01")
aw2

##epicurve.hours
data(oswego)
## create vector with meal date and time
mdt <- paste("4/18/1940", oswego$meal.time)
mdt[1:10]
## convert into standard date and time
meal.dt <- strptime(mdt, "%m/%d/%Y %I:%M %p")
meal.dt[1:10]
## create vector with onset date and time
odt <- paste(paste(oswego$onset.date,"/1940",sep=""), oswego$onset.time)
odt[1:10]
## convert into standard date and time
onset.dt <- strptime(odt, "%m/%d/%Y %I:%M %p")
onset.dt[1:10]      

##set colors
col3seq.d <- c("#43A2CA", "#A8DDB5", "#E0F3DB")

par.fin <- par()$fin
par(fin=c(5,3.4))

##1-hour categories
xv <- epicurve.hours(onset.dt, "1940-04-18 12:00:00", "1940-04-19 12:00:00",
                     axisnames = FALSE, axes = FALSE, ylim = c(0,11),
                     col = col3seq.d[1], segments =  TRUE,
                     strata = oswego$sex)

hh <- xv$chour12==3 | xv$chour12== 6 | xv$chour12== 9
hh2 <- xv$chour12==12
hh3 <- xv$chour12==1
hlab <- paste(xv$chour12,xv$campm2,sep="")
hlab2 <- paste(xv$cmonth,xv$cmday)
axis(1, at = xv$xval[hh], labels = xv$chour12[hh], tick = FALSE, line = -.2)
axis(1, at = xv$xval[hh2], labels = hlab[hh2], tick = FALSE, line = -.2)
axis(1, at = xv$xval[hh3], labels = hlab2[hh3], tick = FALSE, line = 1.0)
axis(2, las = 1)
title(main = "Figure 1. Cases of Gastrointestinal Illness
by Time of Onset of Symptoms (Hour Category)
Oswego County, New York, April 18-19, 2004",
      xlab = "Time of Onset",
      ylab = "Cases")

##1/2-hour categories
xv <- epicurve.hours(onset.dt, "1940-04-18 12:00:00", "1940-04-19 12:00:00",
                     axisnames = FALSE, axes = FALSE, ylim = c(0,11),
                     col = col3seq.d[1], segments =  TRUE,
                     half.hour = TRUE, strata = oswego$sex)
hh <- xv$chour12==3 | xv$chour12== 6 | xv$chour12== 9
hh2 <- xv$chour12==12
hh3 <- xv$chour12==1
hlab <- paste(xv$chour12,xv$campm2,sep="")
hlab2 <- paste(xv$cmonth,xv$cmday)
axis(1, at = xv$xval[hh], labels = xv$chour12[hh], tick = FALSE, line = -.2)
axis(1, at = xv$xval[hh2], labels = hlab[hh2], tick = FALSE, line = -.2)
axis(1, at = xv$xval[hh3], labels = hlab2[hh3], tick = FALSE, line = 1.0)
axis(2, las = 1)
title(main = "Figure 2. Cases of Gastrointestinal Illness
by Time of Onset of Symptoms (1/2 Hour Category)
Oswego County, New York, April 18-19, 2004",
      xlab = "Time of Onset",
      ylab = "Cases")

par(fin=par.fin)


##epicurve.table
xvec <- c(1,2,3,4,5,4,3,2,1)
epicurve.table(xvec)

names(xvec) <- 1991:1999
epicurve.table(xvec)

xmtx <- rbind(xvec, xvec)
rownames(xmtx) <- c("Male", "Female")
epicurve.table(xmtx)

epicurve.table(xmtx, seg = TRUE)





