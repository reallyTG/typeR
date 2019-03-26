## ----eval=FALSE----------------------------------------------------------
#  library(dcmodify)
#  library(magrittr)
#  iris %<>% modify_so( if(Sepal.Width > 4 ) Sepal.Width <- 4 )

## ------------------------------------------------------------------------
data("retailers", package="validate")
head(retailers[-(1:2)],3)

## ------------------------------------------------------------------------
library(dcmodify)
m <- modifier(
  if (other.rev < 0) other.rev <- -1 * other.rev
  , if ( is.na(staff.costs) ) staff.costs <- mean(staff.costs)
)

## ------------------------------------------------------------------------
ret1 <- modify(retailers,m)

## ----eval=FALSE----------------------------------------------------------
#  library(magrittr)
#  ret2 <- retailers %>% modifier(m)

## ----eval=FALSE----------------------------------------------------------
#  retailers %<>% modify_so(
#    if ( other.rev < 0) other.rev <- -1 * other.rev
#    , if ( is.na(staff.costs) ) staff.costs <- mean(staff.costs)
#  )

## ----eval=TRUE-----------------------------------------------------------
library(lumberjack)
# add primary key so cellwise changes can be traced
women$id <- letters[1:15]

out <- women %>>%
  start_log( cellwise$new(key="id") ) %>>%
  modify_so( if (height < mean(height)) height <- mean(height) ) %>>%
  dump_log()

# The log is written to file.
read.csv("cellwise.csv") %>>% head()

