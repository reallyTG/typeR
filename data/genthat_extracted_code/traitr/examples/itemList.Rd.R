library(traitr)


### Name: itemList
### Title: An itemList is used to store a list of similar items or
###   itemgroups with a means to edit individually
### Aliases: itemList

### ** Examples

## Not run: 
##D ## make icons
##D imagedir <- system.file("images",package="traitr")
##D addStockIcons(gsub("\\\\.png","", list.files(path=imagedir)),
##D               list.files(path=imagedir, full.names=TRUE))
##D ## make item
##D item <- itemList(items=list(),
##D                  items_name="Personnel",
##D                  item_factory = function(.) {
##D                    a <- anItemGroup(items=list(
##D                                       name=stringItem(""),
##D                                       rank=choiceItem("Scout",
##D                                            values=c("Scout","Captain","General")),
##D                                       serial.number = stringItem("", label="Serial number")))
##D                    a$post_process <- function(.) {
##D                     .$icon <- tolower(.$get_rank())
##D                     }
##D                    a$to_string <- function(., drop=TRUE) .$to_R()$name
##D                    return(a)
##D                  },
##D                  name="itemlist")
##D 
##D item$make_ui(container=gwindow("itemList test"))
## End(Not run)



