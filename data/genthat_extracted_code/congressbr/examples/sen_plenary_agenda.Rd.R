library(congressbr)


### Name: sen_plenary_agenda
### Title: Returns results from the plenary in the Federal Senate for a
###   specified date
### Aliases: sen_plenary_agenda

### ** Examples

# get info from the second half of March 2014:
sessions <- sen_plenary_agenda(period = "month", date = "20140315")
# or from the first of April 2016:
sessions <- sen_plenary_agenda(period = "day", date = "20160401")



