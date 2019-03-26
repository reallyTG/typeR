library(traitr)


### Name: anItemGroup
### Title: Constructor for ItemGroup instances
### Aliases: anItemGroup

### ** Examples

## Not run: 
##D ## make a simple item group, show in non-default layout
##D i <- anItemGroup(items=list(
##D                  numericItem(0,"x"),
##D                  numericItem(0,"y"),
##D                  stringItem("","z")
##D                  ))
##D lay <- aContainer("x","y", aFrame("z", label="z in a box"))
##D ## some proto methods:
##D i$make_gui(cont=gwindow("Example of itemGroup"), gui_layout=lay)
##D i$get_x()     # get x value
##D i$set_x(10)   # set x value to 10
##D i$to_R()      # get list of x,y,z values
## End(Not run)

## example of using an item group and gbasicdialog to make a modal  GUI
ig <- anItemGroup(items=list(
                    x=numericItem(2)
                    )
                  )

## using gbasicdialog from gWidgets
## Not run: 
##D w <- gbasicdialog("testing", handler=function(h,...) {
##D   . <- h$action                         # action passes in itemgroup
##D   .$output <- sin(.$get_x())
##D },
##D                   action=ig)
##D ig$make_gui(container=w)
##D visible(w, TRUE)  ## modal now
##D print(ig$output)
## End(Not run)



