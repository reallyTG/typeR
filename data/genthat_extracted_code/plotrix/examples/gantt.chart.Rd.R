library(plotrix)


### Name: gantt.chart
### Title: Display a Gantt chart
### Aliases: gantt.chart
### Keywords: misc

### ** Examples

 Ymd.format<-"%Y/%m/%d"
 gantt.info<-list(labels=
  c("First task","Second task","Third task","Fourth task","Fifth task"),
  starts=
  as.POSIXct(strptime(
  c("2004/01/01","2004/02/02","2004/03/03","2004/05/05","2004/09/09"),
  format=Ymd.format)),
  ends=
  as.POSIXct(strptime(
  c("2004/03/03","2004/05/05","2004/05/05","2004/08/08","2004/12/12"),
  format=Ymd.format)),
  priorities=c(1,2,3,4,5))
 vgridpos<-as.POSIXct(strptime(c("2004/01/01","2004/02/01","2004/03/01",
  "2004/04/01","2004/05/01","2004/06/01","2004/07/01","2004/08/01",
  "2004/09/01","2004/10/01","2004/11/01","2004/12/01"),format=Ymd.format))
 vgridlab<-
  c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
 gantt.chart(gantt.info,main="Calendar date Gantt chart (2004)",
  priority.legend=TRUE,vgridpos=vgridpos,vgridlab=vgridlab,hgrid=TRUE)
 # add a little extra space on the right side
 gantt.chart(gantt.info,main="Calendar date Gantt chart (2004)",
 priority.legend=TRUE,vgridpos=vgridpos,vgridlab=vgridlab,hgrid=TRUE,
 xlim=as.POSIXct(strptime(c("2004/01/01","2004/12/20"),
 format=Ymd.format)))
 # if both vgidpos and vgridlab are specified,
 # starts and ends don't have to be dates
 info2<-list(labels=c("Jim","Joe","Jim","John","John","Jake","Joe","Jed","Jake"),
  starts=c(8.1,8.7,13.0,9.1,11.6,9.0,13.6,9.3,14.2),
  ends=c(12.5,12.7,16.5,10.3,15.6,11.7,18.1,18.2,19.0))
 gantt.chart(info2,vgridlab=8:19,vgridpos=8:19,
  main="All bars the same color",taskcolors="lightgray")
 gantt.chart(info2,vgridlab=8:19,vgridpos=8:19,
  main="A color for each label",taskcolors=c(2,3,7,4,8))
 gantt.chart(info2,vgridlab=8:19,vgridpos=8:19,
  main="A color for each interval - with borders",
  taskcolors=c(2,3,7,4,8,5,3,6,"purple"),border.col="black")



