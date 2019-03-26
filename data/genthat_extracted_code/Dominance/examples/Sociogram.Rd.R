library(Dominance)


### Name: Sociogram
### Title: Social Network Graphs
### Aliases: Sociogram
### Keywords: ~kwd1 ~kwd2

### ** Examples

{
## you can eihter use:
data_sheet=data.frame   ("action.from"=c(1,4,2,3,4,3,4,3,4,3,4,3,4,3,4),
                   "action.to"=c(4,1,1,4,3,4,3,4,3,4,3,4,3,4,3),
                   "kind.of.action"= c(4,1,1,4,3,4,3,4,3,4,3,4,3,4,3),stringsAsFactors=FALSE)
items= data.frame ("Name"=c("item1","item2","item3","item4","item5","item6") ,
                   "item.number"=c(1:6),stringsAsFactors=FALSE)
actions=data.frame("name.of.action"= c("leading","following","approach","bite","threat to bite",
                   "kick","threat to kick", "chase","retreat"),
                   "action.number"=c(1:9),
                   "classification"=c(1,2,1,1,1,1,1,1,2) ,
                   "weighting"=c(1,-1,1,1,1,1,1,1,-1),stringsAsFactors=FALSE)
## all  encounters  without leading and following
bytes= "001111111"  
Sociogram(data_sheet,items=items,actions=actions,bytes)
## mor you can use a complete f.e Excel sheet
## you can save this data as basic excel sheet to work with
data(data_Network_1)
## set 1 for action you want to show
bytes= "00111111111000000000"    
Sociogram(data_Network_1,bytes)
}



