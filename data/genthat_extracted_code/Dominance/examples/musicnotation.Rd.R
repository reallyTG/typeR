library(Dominance)


### Name: musicnotation
### Title: Function musicnotation
### Aliases: musicnotation Musicnotation

### ** Examples

{ #you can eihter use:
data_sheet=data.frame   ("action.from"=c(1,4,2,3,4,3,4,3,4,3,4,3,4,3,4),
                         "action.to"=c(4,1,1,4,3,4,3,4,3,4,3,4,3,4,3),
                         "kind.of.action"= c(4,1,1,4,3,4,3,4,3,4,3,4,3,4,3),
                         "Time"=c('03:15:00','03:17:30','03:20:00','03:20:30','03:21:00',
                                  '03:21:30','03:22:00','03:22:30','03:23:00','03:23:30',
                                  '03:25:00','03:25:30','03:26:00','03:26:30','03:27:00'),
                         stringsAsFactors=FALSE)
items= data.frame ("Name"=c("item1","item2","item3","item4","item5","item6") ,
                   "item.number"=c(1:6),stringsAsFactors=FALSE)
actions=data.frame("name.of.action"= c("leading","following","approach","bite","threat to bite",
                                      "kick","threat to kick", "chase","retreat"),
                  "action.number"=c(1:9),
                  "classification"=c(1,2,1,1,1,1,1,1,2) ,
                  "weighting"=c(1,-1,1,1,1,1,1,1,-1),stringsAsFactors=FALSE)
# set colors for special encounters
color= c("green","green","red","red","red","red","red","red")    

Musicnotation(data_sheet=data_sheet,actions=actions,items=items,sort_dominance=TRUE)
#or you can use a complete f.e Excel sheet
#you can save this data as basic excel sheet to work with
data(data_Musicnotation)
Musicnotation(data_sheet=data_Musicnotation,sort_dominance=TRUE) }



