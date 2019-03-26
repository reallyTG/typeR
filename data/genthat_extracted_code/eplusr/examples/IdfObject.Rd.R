library(eplusr)


### Name: IdfObject
### Title: EnergyPlus IDF object
### Aliases: IdfObject

### ** Examples

# read an IDF file
idf <- read_idf(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"),
    idd = use_idd(8.8, download = "auto"))

# get the IdfObject of material named "C5 - 4 IN HW CONCRETE"
mat <- idf$Material$C5_4_IN_HW_CONCRETE

# get object ID
mat$id()

# get object name
mat$name()

# NA will be returned if the class does not have name attribute. For example,
# "Version" class
idf$Version[[1]]$name()

# get underlying IddObject of current class
mat$definition()

# get object comments
mat$get_comment()

# add new object comments
mat$set_comment(c("This is a material named `WD01`", "This object has an ID of 47"))
mat$get_comment()

# append new comments
mat$set_comment("This is an appended comment")
mat$get_comment()

# prepend new comments
mat$set_comment("This is a prepended comment", append = FALSE)
mat$get_comment()

# wrap long comments
mat$set_comment("This is a very long comment that is needed to be wrapped.", width = 30)
mat$get_comment()

# delete old comments and add new one
mat$set_comment("This is the only comment", append = NULL)
mat$get_comment()

# delete all comments
mat$set_comment(NULL)
mat$get_comment()

# get all existing field values
str(mat$get_value())

# get values of field 1, 3, 5
str(mat$get_value(c(1, 3, 5)))

# get character format values instead of a named list
mat$get_value(c(1, 3, 5), simplify = TRUE)

# get values of all field even those that are not set
str(idf$Zone$ZONE_ONE$get_value())

str(idf$Zone$ZONE_ONE$get_value(all = TRUE))

# get field values using shortcuts
mat$Roughness
mat[["Specific_Heat"]]
mat[c(1,2)]
mat[c("Name", "Density")]

# set field values
mat$set_value(name = "new_name", Thickness = 0.02)
mat[c("Name", "Thickness")]

# When `default` argument is set to TRUE and input field values are empty, i.e.
# NA and NULL, the field values will be reset to defaults.
mat[c("Thermal Absorptance", "Solar Absorptance")]

mat$set_value(visible_absorptance = NA, Solar_Absorptance = NA, default = TRUE)
mat[c("Visible Absorptance", "Solar Absorptance")]

# set field values using shortcuts
mat$Name <- "another_name"
mat$Name
mat[["Thickness"]] <- 0.019
mat$Thickness

# check validate
mat$validate()
mat$is_valid()

# if we set density to a negative number
mat$definition()$field_range("Density")
eplusr_option(validate_level = "none") # have to set validate to "none" to do so
mat$Density <- -1
eplusr_option(validate_level = "final") # change back to "final" validate level
mat$is_valid()
# get other objects that this object refereces
mat$ref_from_object() # not referencing other objects
mat$has_ref_from()


# get other objects that reference this object
mat$ref_by_object() # referenced by construction "FLOOR"
names(mat$ref_by_object())

mat$has_ref_by()

# check if having any referenced objects or is referenced by other objects
mat$has_ref()

# get all object data in a data.table format without field units
str(mat$table(unit = FALSE))

# get all object data in a data.table format where all field values are put in a
# list column and field names without unit
str(mat$table(string_value = FALSE, unit = FALSE))

# get all object data in a data.table format where all field values are put in a
# list column and all values are converted into IP units
str(mat$table(string_value = FALSE, in_ip = TRUE))

# get all object data in a data.table format, including tailing empty fields
str(idf$Zone$ZONE_ONE$table(all = TRUE))

# get all object data in a data.table format where each field becomes a column
str(mat$table(wide = TRUE))

# get string format object
mat$string()

# get string format of object, and decrease the space between field values and
# field names
mat$string(sep_at = 15)

# get string format of object, and decrease the leading space of field values
mat$string(leading = 0)

# print the object without comment
mat$print(comment = FALSE)

# print the object, and auto separate field values and field names at the
# largetst character length of field values
mat$print(auto_sep = TRUE)



