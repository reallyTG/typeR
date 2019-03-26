library(vistime)


### Name: vistime
### Title: Create a Timeline
### Aliases: vistime vistime-package
### Keywords: gantt plotly timeline vistime

### ** Examples

# presidents and vice presidents
pres <- data.frame(Position = rep(c("President", "Vice"), each = 3),
                   Name = c("Washington", rep(c("Adams", "Jefferson"), 2), "Burr"),
                   start = c("1789-03-29", "1797-02-03", "1801-02-03"),
                   end = c("1797-02-03", "1801-02-03", "1809-02-03"),
                   color = c('#cbb69d', '#603913', '#c69c6e'),
                   fontcolor = c("black", "white", "black"))

vistime(pres, events="Position", groups="Name", title="Presidents of the USA")

## Not run: 
##D # more complex and colorful example
##D data <- read.csv(text="event,group,start,end,color
##D                        Phase 1,Project,2018-12-22,2018-12-23,#c8e6c9
##D                        Phase 2,Project,2018-12-23,2018-12-29,#a5d6a7
##D                        Phase 3,Project,2018-12-29,2019-01-06,#fb8c00
##D                        Phase 4,Project,2019-01-06,2019-02-02,#DD4B39
##D                        Room 334,Team 1,2018-12-22,2018-12-28,#DEEBF7
##D                        Room 335,Team 1,2018-12-28,2019-01-05,#C6DBEF
##D                        Room 335,Team 1,2019-01-05,2019-01-23,#9ECAE1
##D                        Group 1,Team 2,2018-12-22,2018-12-28,#E5F5E0
##D                        Group 2,Team 2,2018-12-28,2019-01-23,#C7E9C0
##D                        3-200,category 1,2018-12-25,2018-12-25,#1565c0
##D                        3-330,category 1,2018-12-25,2018-12-25,#1565c0
##D                        3-223,category 1,2018-12-28,2018-12-28,#1565c0
##D                        3-225,category 1,2018-12-28,2018-12-28,#1565c0
##D                        3-226,category 1,2018-12-28,2018-12-28,#1565c0
##D                        3-226,category 1,2019-01-19,2019-01-19,#1565c0
##D                        3-330,category 1,2019-01-19,2019-01-19,#1565c0
##D                        1-217.0,category 2,2018-12-27,2018-12-27,#90caf9
##D                        3-399.7,moon rising,2019-01-13,2019-01-13,#f44336
##D                        8-831.0,sundowner drink,2019-01-17,2019-01-17,#8d6e63
##D                        9-984.1,birthday party,2018-12-22,2018-12-22,#90a4ae
##D                        F01.9,Meetings,2018-12-26,2018-12-26,#e8a735
##D                        Z71,Meetings,2019-01-12,2019-01-12,#e8a735
##D                        B95.7,Meetings,2019-01-15,2019-01-15,#e8a735
##D                        T82.7,Meetings,2019-01-15,2019-01-15,#e8a735")
##D 
##D vistime(data)
##D 
##D # ------ It is possible to change all attributes of the timeline using plotly_build(),
##D # ------ which generates a list which can be inspected using str
##D p <- vistime(data.frame(event = 1:4, start = c(Sys.Date(), Sys.Date() + 10)))
##D pp <- plotly_build(p) # transform into a list
##D 
##D # Example 1: change x axis font size:
##D pp$x$layout$xaxis$tickfont <- list(size = 28)
##D pp
##D 
##D # Example 2: change y axis font size (several y-axes, therefore we need a loop):
##D for(i in grep("yaxis*", names(pp$x$layout))) pp$x$layout[[i]]$tickfont <- list(size = 28)
##D pp
##D 
##D # Example 3: Changing events font size
##D for(i in 1:length(pp$x$data)){
##D   if(pp$x$data[[i]]$mode == "text") pp$x$data[[i]]$textfont$size <- 28
##D }
##D pp
##D 
##D # Example 4: change marker size
##D # loop over pp$x$data, and change the marker size of all text elements to 50px
##D for(i in 1:length(pp$x$data)){
##D   if(pp$x$data[[i]]$mode == "markers") pp$x$data[[i]]$marker$size <- 40
##D }
##D pp
## End(Not run)



