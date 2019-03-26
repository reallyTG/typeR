library(svMisc)


### Name: temp_env
### Title: Get an environment dedicated to temporary variables (and create
###   it if needed)
### Aliases: temp_env add_items add_temp assign_temp change_temp
###   exists_temp get_temp delete_temp rm_temp TempEnv addItems addTemp
###   assignTemp changeTemp existsTemp getTemp rmTemp
### Keywords: utilities

### ** Examples

ls(temp_env())

# I have a vector v1 with this:
v1 <- c(a = "some v1 text", b = "another v1 text")
# I want to add items whose name is missing in v1 from v2
v2 <- c(a = "v2 text", c = "the missign item")
add_items(v1, v2, replace = FALSE)
# Not the same as
add_items(v1, v2, replace = TRUE)
# This yield different result (names not used and lost!)
add_items(v1, v2, use.names = FALSE)

add_temp("tst", "item1", c(a = 1, b = 2))
# Retrieve this variable
get_temp("tst")
# Add to item1 in this list without replacement
add_temp("tst", "item1", c(a = 45, c = 3), replace = FALSE)
get_temp("tst")
# Same but with replacement of existing items
add_temp("tst", "item1", c(a = 45, c = 3), replace = TRUE)
get_temp("tst")
# Delete the whole variable
delete_temp("tst")

assign_temp("test", 1:10)
# Retrieve this variable
get_temp("test")

change_temp("tst", "item1", 1:10)
# Retrieve this variable
get_temp("tst")
# Create another item in the list
change_temp("tst", "item2", TRUE)
get_temp("tst")
# Change it
change_temp("tst", "item2", FALSE)
get_temp("tst")
# Delete it (= assign NULL to the item)
change_temp("tst", "item2", NULL)
get_temp("tst")
# Delete the whole variable
delete_temp("tst")

assign_temp("test", 1:10)
# Check if this variable exists
exists_temp("test")
# Remove it
delete_temp("test")
# Does it still exists?
exists_temp("test")



