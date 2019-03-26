library(EasyMARK)


### Name: Maker.CH
### Title: Make a capture history from dates.
### Aliases: Maker.CH
### Keywords: utilities

### ** Examples


#' our date vector, which should line up with the id vector
#' we would normally pull this from a data.frame from an external source
dates = c("2012_07_05","2012_07_01","2012_07_01", "2012_07_02", "2012_07_07", 
"2012_07_01", "2012_07_03", "2012_07_07")

#' ids lined up with our dates. Each id is repeated for each day seen, including the day 
#' it was marked.  
id = c("B","B","A","A","A","C","C","C")

#' See that our vectors are the same length
length(id)
length(dates)

#' date.format can be in a variety of forms: 
#' "%Y_%m_%d" = 2012_07_01
#' "%Y:%m:%d" = 2012:07:01
#' "%Y-%m-%d" = 2012-07-01
#' "%m-%Y-%d" = 07-2012-01
#' "%d-%m-%Y" = 01-07-2012
#' and so on...

#' run our function 
ch = Maker.CH(dates = dates, id = id, date.format = "%Y_%m_%d")


#' out matrix with colnames as the dates seen and rownames as the individual ids
ch




