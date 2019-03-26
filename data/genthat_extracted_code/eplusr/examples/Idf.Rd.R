library(eplusr)


### Name: Idf
### Title: Read, modify, and run an EnergyPlus model
### Aliases: Idf

### ** Examples

# ===== CREATE =====
# read an IDF file
idf <- read_idf(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"),
    idd = use_idd(8.8, download = "auto"))

# ===== MODEL BASIC INFO =====
# get version
idf$version()

# get path
idf$path()

# get names of all groups in current model
str(idf$group_name())

# get names of all defined groups in the IDD
str(idf$group_name(all = TRUE))

# get names of all classes in current model
str(idf$class_name())

# get names of all defined classes in the IDD
str(idf$class_name(all = TRUE))

# check if input is a valid group name in current model
idf$is_valid_group("Schedules")

idf$is_valid_group("Compliance Objects")

# check if input is a valid group name in IDD
idf$is_valid_group("Compliance Objects", all = TRUE)

# check if input is a valid class name in current model
idf$is_valid_class("Building")

idf$is_valid_class("ShadowCalculation")

# check if input is a valid class name in IDD
idf$is_valid_class("ShadowCalculation", all = TRUE)

# ===== OBJECT DEFINITION (IDDOBJECT) =====
# get the a list of underlying IddObjects
idf$definition("Version")

# ===== OBJECT INFO =====
# get IDs of objects in classes
idf$object_id(c("Version", "Zone"))

# when `simplify` is TRUE, an integer vector will be returned instead of a
# named list
idf$object_id(c("Version", "Zone"), simplify = TRUE)

# get names of objects in classes
# NA will be returned if targeted class does not have a name attribute
idf$object_name(c("Building", "Zone", "Version"))

# if `simplify` is TRUE, a character vector will be returned instead of a
# named list
idf$object_name(c("Building", "Zone", "Version"), simplify = TRUE)

# get number of objects in classes
idf$object_num(c("Zone", "Schedule:Compact"))

# check if input is a valid object ID, i.e. there is an object whose ID is
# the same with input integer
idf$is_valid_id(c(51, 1000))

# check if input is a valid object name, i.e., there is an object whose name is
# the same with input string
idf$is_valid_name(c("Simple One Zone (Wireframe DXF)", "ZONE ONE"))

# ===== OBJECT QUERY =====
# get objects using object IDs or names
idf$object(c(3,10))
# NOTE: object name matching is case-insensitive
idf$object(c("Simple One Zone (Wireframe DXF)", "zone one"))

# the names of returned list are "underscore-style" object names
names(idf$object(c("Simple One Zone (Wireframe DXF)", "zone one")))

# get all objects in classes in a named list
idf$object_in_class("Zone")
names(idf$object_in_class("Zone"))

# OR using shortcuts
idf$Zone
idf[["Zone"]]

# search objects using regular expression
length(idf$search_object("R13"))

names(idf$search_object("R13"))

# search objects using regular expression in specifc class
length(idf$search_object("R13", class = "Construction"))

# get more controls on matching using `stringr::regex()`
names(idf$search_object(stringr::regex("zn.*1.*wall", ignore_case = TRUE)))

# ===== DUPLICATE OBJECTS =====
# duplicate objects in "Construction" class
names(idf$Construction)

idf$dup_object("R13WALL")
# new objects will have the same names as the duplicated objects but with a
# suffix "_1", "_2" and etc.
names(idf$Construction)

# new names can also be explicitly specified
idf$dup_object("R13WALL", new_name = "My-R13Wall")

# duplicate an object multiple times
## Not run: idf$dup_object(rep("R13WALL", time = 10))

# ===== ADD OBJECTS =====
# add two new objects in "RunPeriod" class
idf$add_object(rep("RunPeriod", 2),
    value = list(
        list("rp_test_1", 1, 1, 2, 1),

        list(name = "rp_test_2",
            begin_month = 3,
            begin_day_of_month = 1,
            end_month = 4,
            end_day_of_month = 1)
    ),
    comment = list(
        list("Comment for new object 1", "Another comment"),
        list("Comment for new object 2")),
    default = TRUE
)

# ===== INSERT OBJECTS =====
# insert objects from other Idf object
idf_1 <- read_idf(system.file("extdata/1ZoneUncontrolled.idf", package = "eplusr"),
    idd = use_idd(8.8, download = "auto"))

idf_1$object_name("Material")

# rename material name from "C5 - 4 IN HW CONCRETE" to "test", otherwise
# insertion will be aborted as there will be two materials with the same name
# in the idf
idf_1$Material$C5_4_IN_HW_CONCRETE$set_value(name = "test")

# insert the object
idf$ins_object(idf_1$Material$test)

# check if material named "test" is there
idf$object_name("Material")

# $ins_object() is useful when importing design days from a ".ddy" file
## Not run: idf$ins_object(read_idf("foo.ddy"))

# ===== SET OBJECTS =====
# set the thickness of newly inserted material "test" to 0.2 m
idf$set_object("test", value = list(thickness = 0.2))
idf$Material$test$Thickness

# set thermal absorptance of all material to 0.85
id_mat <- idf$object_id("Material", simplify = TRUE)
idf$set_object(id_mat,
    value = rep(
        list(list(thermal_absorptance = 0.85)),
        times = length(id_mat)
    )
)

# check results
lapply(idf$Material, function (mat) mat$Thermal_Absorptance)

# reset thermal absorptance of all material to the default
idf$set_object(id_mat,
    value = rep(
        list(list(thermal_absorptance = NA)),
        times = length(id_mat)
    ),
    default = TRUE
)
# check results
lapply(idf$Material, function (mat) mat$Thermal_Absorptance)

# ===== DELELTE OBJECTS =====
# delete the added run period "rp_test_1", "rp_test_2" and "test" from above
idf$del_object(c("test", "rp_test_1", "rp_test_2"))
names(idf$Material)
names(idf$RunPeriod)

# In "final" validate level, delete will be aborted if the target obejcts are
# referenced by other objects.
# get objects that referenced material "R13LAYER"
eplusr_option("validate_level")

idf$Material_NoMass$R13LAYER$ref_by_object()
length(idf$Material_NoMass$R13LAYER$ref_by_object())

## Not run: idf$del_object("R13LAYER") # will give an error in "final" validate level

# objects referencing target objects can also be delted by setting `referenced`
# to TRUE
## Not run: idf$del_object("R13LAYER", referenced = TRUE) # will give an error in "final" validate level

# ===== SEARCH ADN REPLACE OBJECT VALUES =====
# get objects whose field values contains both "VAV" and "Node"
idf$search_value("WALL")
length(idf$search_value("WALL"))
names(idf$search_value("WALL"))

# replace values using regular expression
# NOTE: No field validation will be performed! Should be treated as a low-level
# method. Use with caution.
idf$replace_value("WALL", "A_WALL")

# ===== VALIDATE MODEL =====
# CRAN does not like long-time tests
## Not run: 
##D # check if there are errors in current model
##D idf$validate()
##D idf$is_valid()
##D 
##D # change validate level to "none", which will enable invalid modifications
##D eplusr_option(validate_level = "none")
##D 
##D # change the outside layer of floor to an invalid material
##D idf$set_object("FLOOR", list(outside_layer = "wrong_layer"))
##D 
##D # change validate level back to "final" and validate the model again
##D eplusr_option(validate_level = "final")
##D 
##D idf$validate()
##D idf$is_valid()
##D 
##D # get IDs of all objects that contains invalid reference fields
##D idf$validate()$invalid_reference$object_id
##D 
##D # fix the error
##D idf$set_object(16, list(outside_layer = idf$Material[[1]]$name()))
##D idf$validate()
##D idf$is_valid()
## End(Not run)
# ===== FORMAT MODEL =====
# get text format of the model
str(idf$string())

# get text format of the model, excluding the header and all comments
str(idf$string(comment = FALSE, header = FALSE))

# ===== SAVE MODEL =====
# check if the model has been modified since read or last saved
idf$is_unsaved()

# save and overwrite current model
## Not run: idf$save(overwrite = TRUE)

# save the model with newly created and modified objects at the top
## Not run: idf$save(overwrite = TRUE, format = "new_top")

# save the model to a new file
idf$save(path = file.path(tempdir(), "test.idf"))

# save the model to a new file and copy all external csv files used in
# "Schedule:File" class into the same folder
idf$save(path = file.path(tempdir(), "test1.idf"), copy_external = TRUE)

# the path of this model will be changed to the saved path
idf$path()

# ===== CLONE MODEL =====
# Idf object are modified in place and has reference semantic.
idf_2 <- idf
idf_2$object_name("Building")
idf$object_name("Building")

# modify idf_2 will also affect idf as well
idf_2$Building[[1]]$set_value(name = "Building_Name_Changed")
idf_2$object_name("Building")
idf$object_name("Building")

# in order to make a copy of an Idf object, use $clone() method
idf_3 <- idf$clone()
idf_3$Building[[1]]$set_value(name = "Building_Name_Changed_Again")
idf_3$object_name("Building")

idf$object_name("Building")

# run the model
## Not run: 
##D if (is_avail_eplus(8.8)) {
##D 
##D     # save the model to tempdir()
##D     idf$save(file.path(tempdir(), "test_run.idf"))
##D 
##D     # use the first epw file in "WeatherData" folder in EnergyPlus v8.8
##D     # installation path
##D     epw <- list.files(file.path(eplus_config(8.8)$dir, "WeatherData"),
##D         pattern = "\\.epw$", full.names = TRUE)[1]
##D     basename(epw)
##D     # [1] "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D 
##D     # if `dir` is NULL, the directory of IDF file will be used as simulation
##D     # output directory
##D     job <- idf$run(epw, dir = NULL)
##D 
##D     # run simulation in the background
##D     idf$run(epw, dir = tempdir(), wait = FALSE)
##D 
##D     # copy all external files into the directory run simulation
##D     idf$run(epw, dir = tempdir(), copy_external = TRUE)
##D 
##D     # check for simulation errors
##D     job$errors()
##D 
##D     # get simulation status
##D     job$status()
##D 
##D     # get output directory
##D     job$output_dir()
##D 
##D     # re-run the simulation
##D     job$run()
##D 
##D     # get simulation results
##D     job$report_data()
##D }
## End(Not run)
# print the text format of model
idf$print(plain = TRUE)



