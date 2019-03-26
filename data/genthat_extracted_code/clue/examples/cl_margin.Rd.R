library(clue)


### Name: cl_margin
### Title: Membership Margins
### Aliases: cl_margin
### Keywords: cluster

### ** Examples

data("GVME")
## Look at the classes obtained for 1980:
split(cl_object_names(GVME[["1980"]]), cl_class_ids(GVME[["1980"]]))
## Margins:
x <- cl_margin(GVME[["1980"]])
## Add names, and sort:
names(x) <- cl_object_names(GVME[["1980"]])
sort(x)
## Note the "uncertainty" of assigning Egypt to the "intermediate" class
## of nations.



