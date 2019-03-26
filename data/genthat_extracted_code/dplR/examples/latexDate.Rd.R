library(dplR)


### Name: latexDate
### Title: Date Conversion to Character in LaTeX Format
### Aliases: latexDate
### Keywords: utilities

### ** Examples

latexDate()                              # today
latexDate(Sys.Date() + 5)                # today + 5 days
latexDate(c("2013-12-06", "2014-09-19")) # fixed dates
## [1] "December 6, 2013"   "September 19, 2014"
latexDate(5*60*60*24, origin=Sys.Date()) # today + 5 days



