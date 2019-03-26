library(forestmangr)


### Name: dom_height
### Title: Calculate the dominant height of forest inventory data plots
### Aliases: dom_height

### ** Examples

library(forestmangr)
data("exfm9")
exfm9

# Let's say we need to get the dominant height (DH) values for a forest inventory data.
# If we don't have a variable that tells which trees are dominant, it's ok. We can
# still estimate DH using this function. It will average the top 2 trees of each plot:
dom_height(df=exfm9,th="TH",dbh="DBH",plot="PLOT")

# Of course, if we do have a variable that differentiate the dominant trees, it's
# best we use it. For that we use the obs argument, and the dom argument.
# In this data, the OBS variable is used to tell the type of tree.
# Let's check the levels in our OBS variable, to see which one is associated 
# with dominant trees.

levels(as.factor(exfm9$OBS))

# So, the "D" level must be the one that tells which trees are dominant. Let's use it: 
dom_height(df=exfm9,th="TH",dbh="DBH",plot="PLOT",obs="OBS",dom="D")

# If there are subdivisions of the data, like different strata, they can be included in the
# .groups argument: 
dom_height(df=exfm9,th="TH",dbh="DBH",plot="PLOT",obs="OBS",dom="D",.groups="STRATA")

# It's possible to automatically bind the dominant heights table to the original data, 
# using the merge_data argument:

dom_height(df=exfm9,th="TH",dbh="DBH",plot="PLOT",obs="OBS",
dom="D",.groups="STRATA", merge_data=TRUE)




