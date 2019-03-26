library(plan)


### Name: plot,gantt-method
### Title: Draw a Gantt diagram
### Aliases: plot,gantt-method plot.gantt

### ** Examples

library(plan)
data(gantt)
summary(gantt)

# 1. Simple plot
plot(gantt)

# 2. Plot with two events
event.label <- c("Proposal", "AGU")
event.time <- c("2008-01-28", "2008-12-10")
plot(gantt, event.label=event.label,event.time=event.time)

# 3. Control x axis (months, say)
plot(gantt,labels=paste("M",1:6,sep=""))

# 4. Control task colours
plot(gantt,
     col.done=c("black", "red", rep("black", 10)),
     col.notdone=c("lightgray", "pink", rep("lightgray", 10)))

# 5. Control event colours (garish, to illustrate)
plot(gantt, event.time=event.time, event.label=event.label,
     lwd.eventLine=1:2, lty.eventLine=1:2,
     col.eventLine=c("pink", "lightblue"),
     col.event=c("red", "blue"), font.event=1:2, cex.event=1:2)

# 6. Top task is in bold font and red colour
plot(gantt,ylabels=list(col="red",font=2))

# 7. Demonstrate zero-time item (which becomes a heading)
gantt[["description"]][1] <- "Preliminaries"
gantt[["end"]][1] <- gantt[["start"]][1]
plot(gantt, ylabel=list(font=2, justification=0))

# 8. Arrows at task ends
plot(gantt, arrows=c("right","left","left","right"))



