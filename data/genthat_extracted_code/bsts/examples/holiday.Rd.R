library(bsts)


### Name: holiday
### Title: Specifying Holidays
### Aliases: Holiday holiday NamedHoliday FixedDateHoliday
###   NthWeekdayInMonthHoliday LastWeekdayInMonthHoliday DateRangeHoliday

### ** Examples


july4 <- FixedDateHoliday("July4", "July", 4)
memorial.day <- LastWeekdayInMonthHoliday("MemorialDay", "May", "Monday")
labor.day <- NthWeekdayInMonthHoliday("LaborDay", "September", "Monday", 1)
another.way.to.get.memorial.day <- NamedHoliday("MemorialDay")
easter <- NamedHoliday("Easter")
winter.olympics <- DateRangeHoliday("WinterOlympicsSince2000",
                     start = as.Date(c("2002-02-08",
                                        "2006-02-10",
                                        "2010-02-12",
                                        "2014-02-07",
                                        "2018-02-07")),
                     end = as.Date(c("2002-02-24",
                                     "2006-02-26",
                                     "2010-02-28",
                                     "2014-02-23",
                                     "2018-02-25")))




