library(baytrends)


### Name: as.double.qw
### Title: Numeric Representations
### Aliases: as.double.qw
### Keywords: internal manip

### ** Examples


## Create a simple qw object 
Test.qw <- as.qw(c(1,2,3,2,4,4), c("<", "<", "<", " ", " ", " "), "", NA_real_,
"Miss", "None", "Mine", "TEST", "")
as.double(Test.qw)
as.numeric(Test.qw)




