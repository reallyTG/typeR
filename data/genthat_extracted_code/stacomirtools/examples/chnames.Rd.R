library(stacomirtools)


### Name: chnames
### Title: This function replaces the variable names in a data.frame
### Aliases: chnames

### ** Examples

df <- data.frame("var1" = c("blue","red"), "var2" = c("nice","ugly"))
colnames(df) # "var1" "var2"
df <- chnames(object = df, old_variable_name = c("var1","var2"), 
"new_variable_name" = c("color","beauty"))
colnames(df) # "color"  "beauty"
# the following will return an error, as the variable wrong_name is not in variable names
## Not run: 
##D chnames(object = df, old_variable_name = c("wrong_name"), 
##D "new_variable_name" = c("color")))
## End(Not run)



