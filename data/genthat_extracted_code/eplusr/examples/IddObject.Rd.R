library(eplusr)


### Name: IddObject
### Title: EnergyPlus IDD object
### Aliases: IddObject

### ** Examples

# get a parent Idd object
idd <- use_idd(8.8, download = "auto")

# get an IddObject of class "Material"
mat <- idd$Material

# get name of IDD group it belongs to
mat$group_name()

# get index of IDD group it belongs to
mat$group_index()

# get name of current IDD class
mat$class_name()

# get index of class IDD class
mat$class_name()

# get minimum field number
mat$min_fields()

# get total field number
mat$num_fields()

# get memo of current class
mat$memo()

# get an IddObject of extensible class "Branch"
bran <- idd$Branch

# check if the class is extensible
bran$is_extensible()

# get number of extensible fields, index of first extensible field and number of
# current extensible groups in "Branch" class
bran$num_extensible()

bran$first_extensible_index()

bran$extensible_group_num()


# get current number of fields
bran$num_fields()

# add ten extensible groups
bran$add_extensible_group(10)
# the number of fields has been increased by 10 * 4 (= 46)
bran$num_fields()

# delete eight extensible groups
bran$del_extensible_group(8)
# the number of fields has been decreased by 8 * 4 (= 32)
bran$num_fields()

# check if current class has name attribute or not
mat$has_name()

# check if current class is required
mat$is_required()

# check if current class is unique
mat$is_unique()

# list all field names without units
mat$field_name()

# list all field names in lower-style
# useful when used as field names in "$set_value()" in IdfObject class
# and "$set_object()" in Idf class.
mat$field_name(lower = TRUE)

# get field indexes
mat$field_index(c("thickness", "roughness", "name"))

# get field types
mat$field_type(c("solar_absorptance", "Density", "Name"))

# get field notes
bran$field_note(c(2, 4))

# get field SI units
mat$field_unit(c(1,3,5), in_ip = FALSE)

# get field IP units
mat$field_unit(c(1,3,5), in_ip = TRUE)

# get field default values in SI units
str(mat$field_default(in_ip = FALSE))

# get field choices
str(mat$field_choice(1:3))

# get field ranges
mat$field_range(c("roughness", "thickness", "conductivity", "solar_absorptance"))

# get all possible values of fields
## Not run: mat$field_possible()

# check if input is a valid field number for current class
## get required minimum field number
mat$min_fields()

# (1) if less than required minimum field number
mat$is_valid_field_num(3)

# (2) if larger than required minimum field number but less than total field
# number
mat$is_valid_field_num(7)

# (3) if larger than total field number
mat$is_valid_field_num(10)
# [1] FALSE

# for extensible class
bran$num_fields()
bran$num_extensible()
# if larger than required minimum field number
# (1) but cannot give whole extensible groups
bran$is_valid_field_num(c(55, 57, 60))

# (2) and can give whole extensible groups
bran$is_valid_field_num(c(58, 62, 70))

# check if input field index is an extensible field index
bran$is_extensible_index(1:4)

# get all field referneces
## Not run: bran$field_reference(1:4)

# check if input is valid field name
# NOTE: lower-style names are treated as valid
mat$is_valid_field_name(c("nAmE", "specific heat", "Specific Heat", "specific_heat"))

# check if input is valid field index
bran$is_valid_field_index(c(1, 4, 54, 57))

# check if fields are autosizable, i.e. can be set to "Autosize"
mat$is_autosizable_field(1:4)

# check if fields are autocalculatable, i.e. can be set to "Autocalculate"
mat$is_autocalculatable_field(1:4)

# check if fields are numeric fields, i.e. field values should be either
# integers or float numbers
mat$is_numeric_field(c("roughness", "thickness", "density"))

# check if fields are integer fields, i.e. field values should be integers
mat$is_integer_field(c("name", "specific_heat"))

# check if fields are required, i.e. field values should not be empty
mat$is_required_field(c("name", "roughness", "solar_absorptance"))




