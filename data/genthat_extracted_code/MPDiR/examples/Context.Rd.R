library(MPDiR)


### Name: Context
### Title: Psychometric Functions for the Effects of Context on Contrast
###   Detection
### Aliases: Context
### Keywords: datasets

### ** Examples

data(Context)
Context <- within(Context, Pc <- NumYes/(NumYes + NumNo))
lattice::xyplot(Pc ~ TargCntr | ContCntr, data = Context, 
	groups = Obs,	type = c("l", "p"),
	auto.key = list(space = "right"))



