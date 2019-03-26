## ---- echo=FALSE---------------------------------------------------------
library(lumberjack)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("lumberjack")

## ------------------------------------------------------------------------
out <- women %L>%
  start_log() %L>%
  identity() %L>%
  head() %L>%
  dump_log()
read.csv("simple_log.csv")

## ------------------------------------------------------------------------
out

## ------------------------------------------------------------------------
logfile <- tempfile(fileext = ".csv") # where the logging info is written
women$a_key <- sprintf("W%02d", seq_len(nrow(women)))   # add a primary key to 'women'

# make the small example ea bit smaller
wom <- head(women,5)

out <- wom %L>%
  start_log( log = cellwise$new(key="a_key") ) %L>%
  within(height <- sqrt(height)) %L>%
  within(weight <- weight*2) %L>%
  dump_log(file=logfile, stop=TRUE)

read.csv(logfile)

## ------------------------------------------------------------------------
logger <- expression_logger$new(mnh = mean(height), sdh = sd(height))
out <- women %L>%
  start_log(logger) %L>%
  transform(height <- height*2.54) %L>% # height in cm
  transform(weight <- weight*0.453592) %L>%
  dump_log()

read.csv("expression_log.csv",stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
dat <- start_log(women, log = simple$new())

## ------------------------------------------------------------------------
dat <- start_log(women, log=simple$new(verbose=FALSE))

## ------------------------------------------------------------------------
out <- dat %L>% identity() %L>% dump_log()
read.csv("simple_log.csv")

## ------------------------------------------------------------------------
out <- dat %L>% 
  start_log() %L>% 
  identity() %L>% 
  dump_log(file="log_all_day.csv")
read.csv("log_all_day.csv")

## ------------------------------------------------------------------------
out <- 1:3 %L>% 
  start_log() %L>%
  {.*2} %L>%
  dump_log(file="foo.csv")

print(out)

read.csv("foo.csv")

