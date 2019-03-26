library(expss)


### Name: expss.options
### Title: Options for controlling behavior of the package
### Aliases: expss.options expss_digits get_expss_digits
###   expss_enable_value_labels_support
###   expss_enable_value_labels_support_extreme
###   expss_disable_value_labels_support expss_output_default
###   expss_output_commented expss_output_raw expss_output_viewer
###   expss_output_rnotebook expss_fix_encoding_on expss_fix_encoding_off

### ** Examples


# example of different levels of value labels support
my_scale = c(1, 2, 2, 2)
# note that we have label 'Hard to say' for which there are no values in 'my_scale'
val_lab(my_scale) = num_lab("
                            1 Yes
                            2 No
                            3 Hard to say
                            ")
# disable labels support
expss_disable_value_labels_support()
table(my_scale) # there is no labels in the result
unique(my_scale) 
# default value labels support
expss_enable_value_labels_support()
# table with labels but there are no label "Hard to say"
table(my_scale)
unique(my_scale) 
# extreme value labels support
expss_enable_value_labels_support_extreme()
# now we see "Hard to say" with zero counts
table(my_scale) 
# weird 'unique'! There is a value 3 which is absent in 'my_scale'
unique(my_scale) 
# return immediately to defaults to avoid issues
expss_enable_value_labels_support()



