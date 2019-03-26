library(rPraat)


### Name: col.read
### Title: col.read
### Aliases: col.read

### ** Examples

## Not run: 
##D coll <- col.read("coll_text.Collection")
##D length(coll)  # number of objects in collection
##D class(coll[[1]])["type"]  # 1st object type
##D class(coll[[1]])["name"]  # 1st object name
##D it <- coll[[1]]  # 1st object
##D it.plot(it)
##D 
##D class(coll[[2]])["type"]  # 2nd object type
##D class(coll[[2]])["name"]  # 2nd object name
##D tg <- coll[[2]]  # 2nd object
##D tg.plot(tg)
##D length(tg)  # number of tiers in TextGrid
##D tg$word$label
##D 
##D class(coll[[3]])["type"]  # 3rd object type
##D class(coll[[3]])["name"]  # 3rd object type
##D pitch <- coll[[3]]  # 3rd object
##D names(pitch)
##D pitch$nx  # number of frames
##D pitch$t[4]        # time instance of the 4th frame
##D pitch$frame[[4]]  # 4th frame: pitch candidates
##D pitch$frame[[4]]$frequency[2]
##D pitch$frame[[4]]$strength[2]
##D 
##D class(coll[[4]])["type"]  # 4th object type
##D class(coll[[4]])["name"]  # 4th object name
##D pt <- coll[[4]]  # 2nd object
##D pt.plot(pt)
## End(Not run)



