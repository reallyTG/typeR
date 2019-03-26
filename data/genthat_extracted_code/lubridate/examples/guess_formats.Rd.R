library(lubridate)


### Name: guess_formats
### Title: Guess possible date-times formats from a character vector
### Aliases: guess_formats

### ** Examples


x <- c('February 20th 1973',
       "february  14, 2004",
       "Sunday, May 1, 2000",
       "Sunday, May 1, 2000",
       "february  14, 04",
       'Feb 20th 73',
       "January 5 1999 at 7pm",
       "jan 3 2010",
       "Jan 1, 1999",
       "jan 3   10",
       "01 3 2010",
       "1 3 10",
       '1 13 89',
       "5/27/1979",
       "12/31/99",
       "DOB:12/11/00",
       "-----------",
       'Thu, 1 July 2004 22:30:00',
       'Thu, 1st of July 2004 at 22:30:00',
       'Thu, 1July 2004 at 22:30:00',
       'Thu, 1July2004 22:30:00',
       'Thu, 1July04 22:30:00',
       "21 Aug 2011, 11:15:34 pm",
       "-----------",
       "1979-05-27 05:00:59",
       "1979-05-27",
       "-----------",
       "3 jan 2000",
       "17 april 85",
       "27/5/1979",
       '20 01 89',
       '00/13/10',
       "-------",
       "14 12 00",
       "03:23:22 pm")

guess_formats(x, "BdY")
guess_formats(x, "Bdy")
## m also matches b and B; y also matches Y
guess_formats(x, "mdy", print_matches = TRUE)

## T also matches IMSp order
guess_formats(x, "T", print_matches = TRUE)

## b and B are equivalent and match, both, abreviated and full names
guess_formats(x, c("mdY", "BdY", "Bdy", "bdY", "bdy"), print_matches = TRUE)
guess_formats(x, c("dmy", "dbY", "dBy", "dBY"), print_matches = TRUE)


guess_formats(x, c("dBY HMS", "dbY HMS", "dmyHMS", "BdY H"), print_matches = TRUE)

guess_formats(x, c("ymd HMS"), print_matches = TRUE)




