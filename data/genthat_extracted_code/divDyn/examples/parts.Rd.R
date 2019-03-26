library(divDyn)


### Name: parts
### Title: Plot time series counts or proportions as polygons
### Aliases: parts

### ** Examples


# dummy examples 
  # independent variable
  slc<-c(rep(1, 5), rep(2,7), rep(3,6))

  # the categories as they change
  v1<-c("a", "a", "b", "c", "c") # 1
  v2<-c("a", "b", "b", "b", "c", "d", "d") # 2
  v3<-c("a", "a", "a", "c", "c", "d") #3
  va<-c(v1, v2,v3)

  # basic function
    plot(NULL, NULL, ylim=c(0,1), xlim=c(0.5, 3.5))
    parts(slc, va, prop=TRUE)
 
  # vertical plot
    plot(NULL, NULL, xlim=c(0,1), ylim=c(0.5, 3.5))
    parts(slc, va, col=c("red" ,"blue", "green", "orange"), xlim=c(0.5,3.5), 
      labs=TRUE, prop=TRUE, vertical=TRUE)

  # intensive argumentation
    plot(NULL, NULL, ylim=c(0,10), xlim=c(0.5, 3.5))
    parts(slc, va, ord=c("b", "c", "d", "a"), col=c("red" ,"blue", "green", "orange"), 
	  xlim=c(0.5,3.5), labs=TRUE, prop=FALSE, 
	  labs.args=list(cex=1.3, col=c("black", "orange", "red", "blue")))

  # just the values
    parts(slc, va, prop=TRUE,plot=FALSE)
	
# real example
  # the proportion of coral occurrences through time in terms of bathymetry
  data(corals)
  data(stages)

  # time scale plot
  tsplot(stages, shading="series", boxes="sys", xlim=c(250,0), 
    ylab="proportion of occurrences", ylim=c(0,1))
  
  # plot of proportions	
  cols <- c("#55555588","#88888888", "#BBBBBB88")
  types <- c("uk", "shal", "deep")
  
  parts(x=stages$mid[corals$stg], b=corals$bath, 
   ord=types, col=cols, prop=TRUE,border=NA, labs=FALSE)
   
  # legend
  legend("left", inset=c(0.1,0), legend=c("unknown", "shallow", "deep"), fill=cols, 
    bg="white", cex=1.4) 




