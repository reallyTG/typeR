library(fmdates)


### Name: year_frac
### Title: The years between two dates for a given day basis convention
### Aliases: year_frac

### ** Examples

require(lubridate)
year_frac(ymd("2010-03-31"), ymd("2012-03-31"), "30/360us") # 2
year_frac(ymd("2010-02-28"), ymd("2012-03-31"), "act/360")  # 2.116667
year_frac(ymd("2010-02-28"), ymd("2012-03-31"), "act/365")  # 2.087671
year_frac(ymd("2010-02-28"), ymd("2012-03-31"), "act/actisda")  # 2.086998



