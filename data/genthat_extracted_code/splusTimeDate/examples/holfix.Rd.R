library(splusTimeDate)


### Name: holiday.fixed
### Title: Holiday Generating Functions
### Aliases: holiday.fixed holiday.weekday.number
### Keywords: chron

### ** Examples

# Generate Christmas 
holiday.fixed(1994:2005, 12, 25) 
# Generate Memorial Day (last Monday in May) 
holiday.weekday.number(1994:2005, 5, 1, -1) 
# Generate Thanksgiving (4th Thursday in November) 
holiday.weekday.number(1994:2005, 11, 4, 4) 



