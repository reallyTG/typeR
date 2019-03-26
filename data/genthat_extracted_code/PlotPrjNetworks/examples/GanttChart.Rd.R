library(PlotPrjNetworks)


### Name: GanttChart
### Title: GanttChart
### Aliases: GanttChart

### ** Examples

project1=data.frame(
    task=c("Market Research","Concept Development","Viability Test",
"Preliminary Design","Process Design","Prototyping","Market Testing","Final Design",
"Launching"),
    start=c("2015-07-05","2015-07-05","2015-08-05","2015-10-05","2015-10-05","2016-02-18",
"2016-03-18","2016-05-18","2016-07-18"),
    end=c("2015-08-05","2015-08-05","2015-10-05","2016-01-05","2016-02-18","2016-03-18",
"2016-05-18","2016-07-18","2016-09-18"))
project2=data.frame(
    from=c(1,2,3,4,5,6,7,8),
    to=c(2,3,4,5,6,7,8,9),
    type=c("SS","FS","FS","SS","FS","FS","FS","FS"),
    delay=c(7,7,7,8,10,10,10,10))
GanttChart(project1,project2)

info=data.frame(
    task=c("Estimate market and make more exact marketing message",
"Design and order final package","Create press releases",
"Create product specification materials","Create marketing presentations",
"Transmit product launch details to international organization",
"Create sales, local, and product support groups training",
"Update product forecasts based on market feedback and analysis",
"Update launch plan based on forecast"),
    start=c("2015-08-20","2015-08-23","2015-08-23","2015-08-23","2015-08-23","2015-09-04",
    "2015-09-05","2015-08-23","2015-08-24"),
    end=c("2015-08-22","2015-08-29","2015-08-29","2015-09-03","2015-08-29","2015-09-05",
    "2015-09-17","2015-08-24","2015-08-28"))
details=data.frame(
    from=c(1,1,1,1,1,1,2,3,4,5,6,8,9),
    to=c(2,3,4,5,6,8,6,6,6,6,7,9,7),
    type=c("FS","FS","FS","FS","FS","FS","FS","FS","FS","FS","FS","FS","FS"),
    delay=c(0,0,0,0,0,0,0,0,0,0,0,0,0))
GanttChart(info,details)



