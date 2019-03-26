library(ryouready)


### Name: collapse_responseset.data.frame
### Title: Collapse multiple response sets to single variable
### Aliases: collapse_responseset collapse_responseset.data.frame
###   collapse_responseset.default

### ** Examples

d <- data.frame(t1=c(1,0,NA,0,0),
                 t2=c(0,1,0,NA,0),
                 t3=c(0,0,1,0,0) )

 # collapse all variables of a dataframe
 collapse_responseset(d)

 # collapse columns 1 to 3 (which is all in this case as well)
 collapse_responseset(d, vars=1:3)
 collapse_responseset(d, vars=c("t1", "t2", "t3"))

 # use letters instead fo numbers for recoding
 collapse_responseset(d, vars=1:3, rec=letters[1:3])

 # use with several vectors
 collapse_responseset(d$t1, d$t2, d$t3)

 # use inside of transform
 transform(d, new=collapse_responseset(t1, t2, t3))

 transform(d, new=collapse_responseset(t1, t2, t3, rec=letters[1:3]))



