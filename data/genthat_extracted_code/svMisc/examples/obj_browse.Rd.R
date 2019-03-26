library(svMisc)


### Name: obj_browse
### Title: Functions to implement an object browser
### Aliases: obj_browse obj_clear obj_dir obj_info obj_list write.objList
###   print.objList obj_search obj_menu objBrowse objClear objDir objInfo
###   objList objSearch objMenu
### Keywords: misc

### ** Examples

# Create various context menus
data(iris)
(obj_info(object = "iris"))
data(trees)
# For one object
(obj_menu(objects = "iris"))
# For multiple objects
(obj_menu(objects = c("iris", "trees")))
# For inexistant object (return "")
(obj_info(object = "noobject"))
(obj_menu(objects = "noobject"))
rm(iris, trees)

# For environments
(obj_info(envir = ".GlobalEnv"))
(obj_menu(envir = ".GlobalEnv"))
(obj_info(envir = "SciViews:TempEnv"))
(obj_menu(envir = "SciViews:TempEnv"))
(obj_info(envir = "package:datasets"))
(obj_menu(envir = "package:datasets"))
# For an environment that does not exist on the search path (return "")
(obj_info(envir = "noenvir"))
(obj_menu(envir = "noenvir"))



