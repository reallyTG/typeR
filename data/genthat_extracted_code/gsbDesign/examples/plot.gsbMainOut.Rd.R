library(gsbDesign)


### Name: plot.gsbMainOut
### Title: Plot methods
### Aliases: plot.gsbMainOut plot.gsbDesign plot.gsbSimulation
### Keywords: plot

### ** Examples


## please see examples of function 'gsb'. 
## --------------------------------------


## --------------------------------------
## alternative plots can be created for example
## with package 'ggplot2'.
## Not run: 
##D des <- gsbDesign(nr.stages=2,
##D                      patients=10,
##D                      sigma=10,
##D                      criteria.success=c(0,0.8, 7, 0.5),
##D                      criteria.futility=c(2,0.8),
##D                      prior.difference="non-informative")
##D 
##D sim <- gsbSimulation(truth=c(-10,20,60),
##D                              type.update="treatment effect")
##D 
##D 
##D x <- gsb(des,sim)
##D 
##D ## get data.frame with operating characteristics
##D datgraph <- x$OC
##D 
##D 
##D ## prepare for plot
##D sub <- levels(datgraph$type)[1:3]
##D datgraph2 <- subset(datgraph,datgraph$type %in% sub)
##D datgraph2$type <- as.factor(paste(datgraph2$type))
##D datgraph2$value[datgraph2$type=="cumulative success or futility"] <-
##D 1-datgraph2$value[datgraph2$type=="cumulative success or futility"]
##D levels(datgraph2$type) <- c("1)cumulative futility" ,"3)cumulative success","2)indeterminate")
##D datgraph2$type=as.factor(paste(datgraph2$type))
##D levels(datgraph2$type) <- c("cumulative futility" ,"indeterminate","cumulative success")
##D datgraph2 <- datgraph2[order(datgraph2$delta),]
##D 
##D 
##D ## plots
##D p1 <- qplot(delta,value,geom="blank",color=type,facets=.~stage,data=datgraph2,
##D xlab=expression(delta))
##D 
##D p1+geom_line(size=1.5)+scale_color_manual(values = c("cumulative futility" = "dark red",
##D "indeterminate" = "orange", "cumulative success" = "dark green"))
##D 
##D p2=p1+geom_area(aes(x = delta,y=value,fill=type))
##D 
##D p2+scale_fill_manual(values = c("cumulative futility" = "dark red",
##D "indeterminate" = "orange", "cumulative success" = "dark green"))
##D 
## End(Not run)



