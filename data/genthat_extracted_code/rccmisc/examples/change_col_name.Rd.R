library(rccmisc)


### Name: change_col_name
### Title: Change one column name of a data.frame
### Aliases: change_col_name

### ** Examples

ab <- ba <- data.frame(a = letters[1:10], b = 1:10)

# One "traditional" way to change a column name
names(ab)[names(ab) == "a"] <- "b"
names(ab)
ab$b # Returns the first column with name "b"

# Using change_col_names instead:
change_col_name(ba, "a", "b")




