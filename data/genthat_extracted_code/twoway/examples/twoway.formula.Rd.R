library(twoway)


### Name: twoway.formula
### Title: Formula method for twoway analysis using a dataset in long
###   format
### Aliases: twoway.formula

### ** Examples

longRT <- to_long(taskRT)
twoway(RT ~ Task + Topic, data=longRT)



