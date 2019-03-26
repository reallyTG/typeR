library(FI)


### Name: volume
### Title: Estimates the stem volume
### Aliases: volume

### ** Examples

example_data <- data.frame(tree_number = 1,
                           dhb = 5,
                           total_height = 20,
                           comercial_height = 15,
                           section_height = c(0,5,15),
                           section_diameter = 5
                           )
volume(example_data)
#
#
# A little more complex and common example
data(inventory)
volume_output <- volume(inventory)
summary(volume_output)
hist(volume_output)



