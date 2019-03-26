library(prettyR)


### Name: addxtabs
### Title: Add the cells of two or more xtab objects
### Aliases: addxtabs
### Keywords: misc

### ** Examples

 # Assume that respondents are asked to record the location and quantity for
 # three occasions of drinking, and for each occasion the fields are named
 # "drinks" and "loc"
 drinkloc<-data.frame(drinks1=sample(c("1-2","3-5","6+"),100,TRUE),
  loc1=sample(c("Meal at home","Restaurant","Party","Pub"),100,TRUE),
  drinks2=sample(c("1-2","3-5","6+"),100,TRUE),
  loc2=sample(c("Meal at home","Restaurant","Party","Pub"),100,TRUE),
  drinks3=sample(c("1-2","3-5"),100,TRUE),
  loc3=sample(c("Meal at home","Restaurant","Party"),100,TRUE))
 # notice how two options have been left out in drink3 and loc3
 # create the list of xtab objects
 dltablist<-list()
 dltablist[[1]]<-xtab(loc1~drinks1,drinkloc)
 dltablist[[2]]<-xtab(loc2~drinks2,drinkloc)
 dltablist[[3]]<-xtab(loc3~drinks3,drinkloc)
 # now sum the corresponding cells
 addxtabs(dltablist)



