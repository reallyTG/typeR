library(xts)


### Name: .parseISO8601
### Title: Internal ISO 8601:2004(e) Time Parser
### Aliases: ISO8601 parseISO8601 makeISO8601 .parseISO8601 .makeISO8601
### Keywords: utilities

### ** Examples

# the start and end of 2000
.parseISO8601('2000')

# the start of 2000 and end of 2001
.parseISO8601('2000/2001')

# May 1, 2000 to Dec 31, 2001
.parseISO8601('2000-05/2001')

# May 1, 2000 to end of Feb 2001
.parseISO8601('2000-05/2001-02')

# Jan 1, 2000 to Feb 29, 2000; note the truncated time on the LHS
.parseISO8601('2000-01/02')

# 8:30 to 15:00 (used in xts subsetting to extract recurring times)
.parseISO8601('T08:30/T15:00')



