library(memisc)


### Name: measurement
### Title: Levels of Measurement of Survey Items
### Aliases: measurement measurement,ANY-method measurement,item-method
###   measurement<- measurement<-,item-method is.nominal is.ordinal
###   is.interval is.ratio
### Keywords: manip

### ** Examples

answer <- sample(c(1,2,3,8,9),size=30,replace=TRUE)
labels(answer) <- c(Conservatives         =  1,
                    Labour                =  2,
                    "Liberal Democrats"   =  3,
                    "Don't know"          =  8,
                    "Answer refused"      =  9
                    )
missing.values(answer) <- c(8,9)
as.data.frame(answer)[[1]]
measurement(answer) <- "interval"
as.data.frame(answer)[[1]]



