library(congressbr)


### Name: sen_bills_passing
### Title: Downloads and tidies information on legislation that is under
###   consideration in the Federal Senate
### Aliases: sen_bills_passing

### ** Examples

## No test: 
sen_bills_passing()
# All MPVs (provisional presidential decrees) in 2001:
mpvs <- sen_bills_passing(year = "2001", type = "MPV")
# Bills from a certain date:
march01_2017 <- sen_bills_passing(date = 20170301)
## End(No test)



