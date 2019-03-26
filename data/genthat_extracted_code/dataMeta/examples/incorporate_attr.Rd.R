library(dataMeta)


### Name: incorporate_attr
### Title: Incorporate attributes as metadata to an original dataset.
### Aliases: incorporate_attr

### ** Examples

# example original data set for which a dictionary will be made
data("esoph")
my.data <- esoph

# Linker: Add description for each variable names and variable type
variable_description <- c("age group in years", "alcohol consumption in gm/day", 
"tobacco consumption in gm/day", "number of cases (showing range)", 
"number of controls (showing range)")
variable_type <- c(0, 0, 0, 0, 0)
linker <- build_linker(my.data = my.data, variable_description = variable_description, 
variable_type = variable_type)
linker

# Data dictionary
# For this data set, no further option description is needed.
dictionary <- build_dict(my.data = my.data, linker = linker, option_description = NULL, 
prompt_varopts = FALSE)
dictionary

# Create main_string for attributes
main_string <- "This dataset describes tobacco and alcohol consumption at different age groups."
complete_dataset <- incorporate_attr(my.data = my.data, data.dictionary = dictionary, 
main_string = main_string)
complete_dataset
attributes(complete_dataset)




