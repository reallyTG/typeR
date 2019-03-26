library(GrpString)


### Name: EveString
### Title: Converts sequences of event names to strings - generalized
### Aliases: EveString
### Keywords: programming

### ** Examples

data(eventChar.df)
event1d <- paste(path.package("GrpString"), "/extdata/eve1d.txt", sep = "")
EveString(event1d, eventChar.df$event, eventChar.df$char)



