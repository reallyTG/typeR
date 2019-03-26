library(GrpString)


### Name: EveStr
### Title: Converts sequences of event names to strings - same length
### Aliases: EveStr
### Keywords: programming

### ** Examples

# small number of event names
event.df <- data.frame(c("aoi_1", "aoi_2"),
                     c("aoi_1", "aoi_3"),
                     c("aoi_3", "aoi_5"))
event.name.vec <- c("aoi_1", "aoi_2", "aoi_3", "aoi_4", "aoi_5")
label.vec <- c("a", "b", "c", "d", "e")
EveStr(event.df, event.name.vec, label.vec)

# more event names
data(event1s.df) 
data(eventChar.df)
EveStr(event1s.df, eventChar.df$event, eventChar.df$char)



