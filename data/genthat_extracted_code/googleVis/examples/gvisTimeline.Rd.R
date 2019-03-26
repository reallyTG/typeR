library(googleVis)


### Name: gvisTimeline
### Title: Google Timeline Chart with R
### Aliases: gvisTimeline
### Keywords: iplot

### ** Examples

dat <- data.frame(Term=c("1","2","3"),
                  President=c("Whasington", "Adams", "Jefferson"),
                  start=as.Date(x=c("1789-03-29", "1797-02-03", "1801-02-03")),
                  end=as.Date(x=c("1797-02-03", "1801-02-03", "1809-02-03")))

tl <- gvisTimeline(data=dat[,-1], rowlabel="President", 
                   start="start", end="end")
plot(tl)

tl <- gvisTimeline(data=dat, barlabel="President", 
                   start="start", end="end")
plot(tl)

tl <- gvisTimeline(data=dat, rowlabel="President", 
                   start="start", end="end",
                   options=list(timeline="{showRowLabels:false}"))
plot(tl)

dat <- data.frame(Position=c(rep("President", 3), rep("Vice", 3)),
                  Name=c("Washington", "Adams", "Jefferson",
                         "Adams", "Jefferson", "Burr"),
                  start=as.Date(x=rep(c("1789-03-29", "1797-02-03", "1801-02-03"),2)),
                  end=as.Date(x=rep(c("1797-02-03", "1801-02-03", "1809-02-03"),2)))

tl <- gvisTimeline(data=dat, rowlabel="Name",barlabel="Position", 
                   start="start", end="end",
                   options=list(timeline="{showRowLabels:true}"))
plot(tl)

tl <- gvisTimeline(data=dat, rowlabel="Name",barlabel="Position", 
                   start="start", end="end",
                   options=list(timeline="{groupByRowLabel:false}",
                                backgroundColor='#ffd', height=350,
                                colors="['#cbb69d', '#603913', '#c69c6e']"))

plot(tl)

# Datetime example 
dat <- data.frame(Room=c("Room 1","Room 2","Room 3"),
                  Language=c("English", "German", "French"),
                  start=as.POSIXct(c("2014-03-14 14:00", "2014-03-14 15:00", 
                                     "2014-03-14 14:30")),
                 end=as.POSIXct(c("2014-03-14 15:00", "2014-03-14 16:00", 
                                  "2014-03-14 15:30")))
tl <- gvisTimeline(data=dat, rowlabel="Language",
                   start="start", end="end")
plot(tl)

## Not run: 
##D require(timeline)
##D data(ww2)
##D timeline(ww2, ww2.events, event.spots=2, event.label='', event.above=FALSE)
##D ww2$Person <- gsub("\\n" ," ", ww2$Person)
##D plot(gvisTimeline(ww2, barlabel="Person", rowlabel="Group",
##D                   start="StartDate", end="EndDate",
##D      options=list(width=600, height=350))
##D )
## End(Not run)



