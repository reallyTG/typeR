library(batman)


### Name: to_logical
### Title: Convert categorical representations of true/false values to a
###   logical
### Aliases: to_logical

### ** Examples

# A very simple example using the pre-known true and false equivalents
categorical_values <- c("true","t","y","yes","f","no","1")
to_logical(categorical_values)

# Use a custom specifier
categorical_values <- c("NA","NA","NA","NA","NA","NA","NA","NA","Batman")
to_logical(categorical_values, custom_true = c("Batman"))



