## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(timeR)

## ------------------------------------------------------------------------
library(timeR)
# Create a timer object
my_timer <- createTimer()

# start timing for an event
my_timer$start("event one")

#start timing for another event
my_timer$start("event two")

# stop timing for the events
my_timer$stop("event one")
my_timer$stop("event two", comment = "my comment") # comment is optional

# retrieve the table for all recordings
getTimer(my_timer)

# or create a timer object and setting verbose to false
my_timer2 <- createTimer(verbose = F)

# toggle on/off verbose
my_timer$toggleVerbose()

# warnings will still be shown when verbose is turned off
my_timer$stop("event one")



## ------------------------------------------------------------------------
#initialize a timer object named mytimer
mytimer <- createTimer()

# event 1
mytimer$start("event 1")
# do something here
Sys.sleep(1)
mytimer$stop("event 1")

#event 2
mytimer$start("event 2")
# do something here
Sys.sleep(1)
mytimer$stop("event 2",comment = "custom comment")

# print records
getTimer(mytimer)

## ------------------------------------------------------------------------
#initalize a dataframe to store the information
timer_df = data.frame(matrix(ncol = 5, nrow = 0))
colnames(timer_df) <- c("event","start","end","timeElapsed","comment")
#event 1
t1 <- Sys.time()
# do something here
Sys.sleep(1)
t2 <- Sys.time()

timer_df <- rbind(timer_df,
                  data.frame(start = t1, 
                             end = t2, 
                             event = "event 1",
                             timeElapsed = t2-t1,
                             comment=NA))

#event 2
t1 <- Sys.time()
# do something here
Sys.sleep(1)
t2 <- Sys.time()

timer_df <- rbind(timer_df,
                  data.frame(start = t1, 
                             end = t2, 
                             event = "event 2",
                             timeElapsed = t2-t1,
                             comment = "custom comment"))

# print records
timer_df

