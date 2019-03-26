library(gdata)


### Name: update.list
### Title: Update the elements of a list
### Aliases: update.list
### Keywords: data manip

### ** Examples

old <- list(a=1,b="red",c=1.37)
new <- list(b="green",c=2.4)

update(old, new)
update.list(old,new)  # equivalent

older <- list(a=0, b="orange", 4, 5, 6)
newer <- list(b="purple", 7, 8, 9)
update(older, newer)               # ignores unnamed elements of newer
update(older, newer, unnamed=TRUE) # appends unnamed elements of newer




