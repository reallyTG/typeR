library(dsmodels)


### Name: dsproto
### Title: Create a new dsproto object
### Aliases: dsproto dsproto_parent $.dsproto_parent [[.dsproto
###   as.list.dsproto print.dsproto format.dsproto print.dsproto_method
###   format.dsproto_method
### Keywords: internal

### ** Examples

#Create a class called "dog"
doggy <- dsproto(`_class` = "dog", `_inherit` = NULL)
#Add children to the parent class "dog". Then add members.
GS <- dsproto(`_class` = "German Shephard", `_inherit` = doggy,
        name = "Pedro",
        color = "Brown",
        personality = "Friendly",
        age = 1,
        parents = list("Spot", "Alfred"),
        birthday = function(self) self$age = self$age + 1)
#Call those members
GS$color
GS$age
#Call a function member
GS$birthday()
#Happy Birthday to Pedro! Your dog is now 2! Let's see what the age returns
GS$age



