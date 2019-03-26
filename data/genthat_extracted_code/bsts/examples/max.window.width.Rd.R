library(bsts)


### Name: max.window.width
### Title: Maximum Window Width for a Holiday
### Aliases: MaxWindowWidth MaxWindowWidth.default
###   MaxWindowWidth.DateRangeHoliday
### Keywords: models regression

### ** Examples


easter <- NamedHoliday("Easter", days.before = 2, days.after = 1)
if (MaxWindowWidth(easter) == 4) {
  print("That's the right answer!\n")
}

## This holiday lasts two days longer in 2005 than in 2004.
may18 <- DateRangeHoliday("May18",
     start = as.Date(c("2004-05-17",
                       "2005-05-16")),
     end   = as.Date(c("2004-05-19",
                       "2005-05-20")))

if (MaxWindowWidth(may18) == 5) {
   print("Right again!\n")
}




