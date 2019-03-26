library(reshape)


### Name: reshape1
### Title: Casting workhorse.
### Aliases: reshape1
### Keywords: internal

### ** Examples

ffm <- melt(french_fries, id=1:4, na.rm = TRUE)
# Casting lists ----------------------------
cast(ffm, treatment ~ rep | variable, mean)
cast(ffm, treatment ~ rep | subject, mean)
cast(ffm, treatment ~ rep | time, mean)
cast(ffm, treatment ~ rep | time + variable, mean)
names(airquality) <- tolower(names(airquality))
aqm <- melt(airquality, id=c("month", "day"), preserve=FALSE)
#Basic call
reshape1(aqm, list("month", NULL), mean)
reshape1(aqm, list("month", "variable"), mean)
reshape1(aqm, list("day", "month"), mean)

#Explore margins  ----------------------------
reshape1(aqm, list("month", NULL), mean, "month")
reshape1(aqm, list("month", NULL) , mean, "grand_col")
reshape1(aqm, list("month", NULL) , mean, "grand_row")

reshape1(aqm, list(c("month", "day"), NULL), mean, "month")
reshape1(aqm, list(c("month"), "variable"), mean, "month")
reshape1(aqm, list(c("variable"), "month"), mean, "month")
reshape1(aqm, list(c("month"), "variable"), mean, c("month","variable"))

reshape1(aqm, list(c("month"), "variable"), mean, c("grand_row"))
reshape1(aqm, list(c("month"), "variable"), mean, c("grand_col"))
reshape1(aqm, list(c("month"), "variable"), mean, c("grand_row","grand_col"))

reshape1(aqm, list(c("variable","day"),"month"), mean,c("variable"))
reshape1(aqm, list(c("variable","day"),"month"), mean,c("variable","grand_row"))
reshape1(aqm, list(c("month","day"), "variable"), mean, "month")

# Multiple fnction returns  ----------------------------
reshape1(aqm, list(c("month", "result_variable"), NULL), range)
reshape1(aqm, list(c("month"),"result_variable") , range)
reshape1(aqm, list(c("result_variable", "month"), NULL), range)

reshape1(aqm, list(c("month", "result_variable"), "variable"), range, "month")
reshape1(aqm, list(c("month", "result_variable"), "variable"), range, "variable")
reshape1(aqm, list(c("month", "result_variable"), "variable"), range, c("variable","month"))
reshape1(aqm, list(c("month", "result_variable"), "variable"), range, c("grand_col"))
reshape1(aqm, list(c("month", "result_variable"), "variable"), range, c("grand_row"))

reshape1(aqm, list(c("month"), c("variable")), function(x) diff(range(x))) 


