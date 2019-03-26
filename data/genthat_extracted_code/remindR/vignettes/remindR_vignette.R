## ----just_code, echo = FALSE---------------------------------------------
    myfunc <- function(x, data, subset, ...){
    ## some comments
##    ... some more code ... ## more comments
   NULL
    }

## ----first_reminder, echo = FALSE----------------------------------------
    myfunc <- function(x, data, subset, ...){
    ## some comments
    ## << Need to make sure factors in data are handled properly if levels
    ## disappear due to subsetting >>
   NULL
    }

## ----remind_first, comment = ""------------------------------------------
library(remindR)
remind(myfunc)

## ----second_reminder, echo = FALSE---------------------------------------
    myfunc <- function(x, data, subset, ...){
    ## some comments
    ## << Need to make sure factors in data are handled properly if levels
    ## disappear due to subsetting >>
    ## << Consider adding a smoothing option to pass down to the plot call>>
   NULL
    }

## ----remind_second, comment = ""-----------------------------------------
library(remindR)
remind(myfunc)

## ----fun_attr, comment = ""----------------------------------------------
remind(myfunc) <- "This is something I want to pay attention to"

## Now show all reminders

remind(myfunc)

## ----obj_attr, comment = ""----------------------------------------------
x <- runif(5)
remind(x) <- c("Some boring pseudo-random numbers","and nothing else")

remind(x)

## ----tooltip, comment = ""-----------------------------------------------
myfunc <- function(x)log(x)

remind(myfunc) <- "Don't forget that the x argument must be all positive
or you'll get NaN's or -Inf's"

