## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  screenshot.force = FALSE
)

# the default output hook
hook_output = knitr::knit_hooks$get('output')
knitr::knit_hooks$set(output = function(x, options) {
  if (!is.null(n <- options$out.lines)) {
    x = unlist(stringr::str_split(x, '\n'))
    if (length(x) > n) {
      # truncate the output
      x = c(head(x, n), '....\n')
    }
    x = paste(x, collapse = '\n') # paste first n lines together
  }
  hook_output(x, options)
})

knitr::opts_knit$set(root.dir = tempdir())

options(crayon.enabled = FALSE)

can_run <- eplusr:::os_type() != "unknown"

## ----cran-install, eval = FALSE------------------------------------------
#  install.packages("eplusr")

## ----gh-installation, eval = FALSE---------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("hongyuanjia/eplusr")

## ----eplus-install, eval = FALSE-----------------------------------------
#  # install the latest version (currently v9.0.0)
#  eplusr::install_eplus("latest")
#  
#  # OR download the latest version (currently v9.0.0) and run the installer
#  # manually by yourself
#  eplusr::download_eplus("latest", dir = tempdir())

## ----install_eplus, include = FALSE, eval = can_run----------------------
# download portable EnergyPlus
if (!eplusr::is_avail_eplus(8.8)) {
    binary_url <- eplusr:::eplus_download_url(8.8)
    if (eplusr:::is_windows()) {
        ext <- ".zip"
    } else {
        ext <- ".tar.gz"
    }
    port_url <- paste0(tools::file_path_sans_ext(binary_url), ext)
    dest <- file.path(tempdir(), basename(port_url))
    dl <- eplusr:::download_file(port_url, dest)
    eplus_dir <- file.path(tools::file_path_sans_ext(basename(binary_url)), "EnergyPlus-8-8-0")
    if (eplusr:::is_windows()) {
        unzip(dest, exdir = tempdir())
    } else {
        untar(dest, exdir = tempdir())
    }
    eplusr::use_eplus(file.path(tempdir(), eplus_dir))
}

## ---- results = "asis", echo = FALSE, eval = can_run, include = can_run----
cat('
<p align="center">
  <img src="../man/figures/class_structure.png"/>
</p>
')

## ----copy_example, include = FALSE, eval = can_run-----------------------
library(eplusr)

cfg <- eplus_config(8.8)

example_name <- "5Zone_Transformer.idf"
weather_name <- "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
ddy_name <- "USA_CA_San.Francisco.Intl.AP.724940_TMY3.ddy"

path_example <- file.path(cfg$dir, "ExampleFiles", example_name)
path_weather <- file.path(cfg$dir, "WeatherData", weather_name)
path_ddy <- file.path(cfg$dir, "WeatherData", ddy_name)

file.copy(path_example, tempdir(), overwrite = TRUE)
file.copy(c(path_weather, path_ddy),
  file.path(tempdir(), c("San_Francisco.epw", "San_Francisco.ddy")), overwrite = TRUE)

## ----idd_dl, eval = FALSE------------------------------------------------
#  path_idd <- download_idd(8.8)
#  use_idd(path_idd)
#  
#  # OR
#  use_idd(8.8, download = TRUE)

## ----idd_solaris, include = FALSE, eval = !can_run-----------------------
#  library(eplusr)
#  use_idd(8.8, download = TRUE)
#  path_example <- "https://raw.githubusercontent.com/NREL/EnergyPlus/v8.8.0/testfiles/5Zone_Transformer.idf"
#  path_weather <- "https://raw.githubusercontent.com/NREL/EnergyPlus/v8.8.0/weather/USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
#  path_ddy <- "https://raw.githubusercontent.com/NREL/EnergyPlus/v8.8.0/weather/USA_CA_San.Francisco.Intl.AP.724940_TMY3.ddy"
#  
#  eplusr:::download_file(path_example, file.path(tempdir(), basename(path_example)))
#  eplusr:::download_file(path_weather, file.path(tempdir(), "San_Francisco.epw"))
#  eplusr:::download_file(path_ddy, file.path(tempdir(), "San_Francisco.ddy"))

## ----read, out.lines = 30------------------------------------------------
model <- read_idf(path = "5Zone_Transformer.idf", idd = NULL)

model

## ----idf_methods---------------------------------------------------------
setdiff(ls(model), "initialize")

## ----all_grp, out.lines = 14---------------------------------------------
model$group_name()

## ----all_cls, out.lines = 14---------------------------------------------
model$class_name()

## ----all_field-----------------------------------------------------------
def_mat <- model$definition(class = "Material")[[1]]
def_mat

## ----idd_obj-------------------------------------------------------------
idd <- use_idd(8.8)

idd$Material

# OR
# idd$object("Material")[[1]]

## ----iddobj_methods------------------------------------------------------
setdiff(ls(def_mat), "initialize")

## ----mat_def-------------------------------------------------------------
def_val <- def_mat$field_default()
def_val

## ----def_type------------------------------------------------------------
vapply(def_val, class, character(1))

## ----all_id, out.lines = 20----------------------------------------------
model$object_id(class = c("Material", "Construction"), simplify = FALSE)

## ----obj_nm--------------------------------------------------------------
model$object_name(class = c("Version", "Material", "Construction"), simplify = FALSE)

## ----obj_num-------------------------------------------------------------
model$object_num(c("BuildingSurface:Detailed", "Material", "Output:Variable"))

## ----obj-----------------------------------------------------------------
model$object(c("WD10", "ROOF-1"))

## ----obj_in_cls, out.lines = 30------------------------------------------
model$object_in_class("Material")

## ----obj_in_cls_shortcut_1, out.lines = 30-------------------------------
model$Material_NoMass
# OR
# model[["Material_NoMass"]]

## ----rp------------------------------------------------------------------
rp <- model$RunPeriod[[1]]
rp

## ----search_obj, out.lines = 20------------------------------------------
model$search_object("Demand", class = "Branch")

## ----idfobj_methods------------------------------------------------------
setdiff(ls(rp), "initialize")

## ----s3_obj--------------------------------------------------------------
rp$Begin_Day_of_Month

# OR
rp[["Begin_Day_of_Month"]]
rp[[3]]

## ----chain---------------------------------------------------------------
model$RunPeriod$WinterDay$Begin_Day_of_Month

## ----dup-----------------------------------------------------------------
model$dup_object(c("ROOF-1", "ROOF-1", "WALL-1"))

## ----add_obj-------------------------------------------------------------
model$add_object(rep("RunPeriod", 2),
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

## ----set_obj-------------------------------------------------------------
model$set_object("rp_test_1", list(name = "rp_test_3", begin_day_of_month = 2),
  comment = list(format(Sys.Date()), "begin day has been changed."))

## ----set_ref-------------------------------------------------------------
mat <- model$Material$CC03

# get other objects referencing this object
mat$ref_by_object()

mat$set_value(name = "CC03_renamed")

mat$ref_by_object()

## ----possible------------------------------------------------------------
mat$possible_value()

## ----ddy, warning=TRUE, out.lines = 20-----------------------------------
# read ddy file as normal IDF
ddy <- read_idf("San_Francisco.ddy", idd = 8.8)

model$ins_object(ddy$SizingPeriod_DesignDay)

## ----ref_by--------------------------------------------------------------
clng <- model$Material_NoMass$MAT_CLNG_1
clng$ref_by_object()

## ----del, error = TRUE---------------------------------------------------
eplusr_option("validate_level")
model$del_object("mat-clng-1")

## ----del_force-----------------------------------------------------------
eplusr_option(validate_level = "draft")
invisible(model$del_object("mat-clng-1", referenced = TRUE))

## ----valid, error = TRUE-------------------------------------------------
eplusr_option(validate_level = "final")
model$validate()

## ----save, eval = FALSE--------------------------------------------------
#  model$save(overwrite = TRUE)
#  
#  model$save("test.idf")

## ----avail_eplus---------------------------------------------------------
avail_eplus()

## ----use_eplus, eval = FALSE---------------------------------------------
#  use_eplus("C:/EnergyPlusV8-8-0")

## ----install, eval = FALSE-----------------------------------------------
#  install_eplus(ver = 8.9)

## ----epw-download--------------------------------------------------------
epw_sf <- download_weather("san francisco.*tmy3", filename = "San_Francisco",
    dir = tempdir(), type = "epw", ask = FALSE)

## ----epw-----------------------------------------------------------------
epw_sf <- read_epw(epw_sf)
epw_sf

## ----epw_method----------------------------------------------------------
setdiff(ls(epw_sf), "initialize")

## ----epw_data------------------------------------------------------------
epw_data <- epw_sf$get_data()
str(epw_data)

## ----run, eval = can_run-------------------------------------------------
# read the model again
model <- read_idf("5Zone_Transformer.idf", idd = NULL)

job <- model$run(epw_sf, dir = ".", wait = TRUE)
job

## ----errors, eval = can_run----------------------------------------------
job$errors()

## ----dict, eval = can_run------------------------------------------------
str(job$report_data_dict())

## ----output, eval = can_run----------------------------------------------
str(job$report_data(name = "Site Outdoor Air Drybulb Temperature"))

## ----tab, eval = can_run-------------------------------------------------
str(job$tabular_data())

## ----del_job, include = FALSE, eval = can_run----------------------------
clean_wd(model$path())

## ----param, eval = can_run-----------------------------------------------
param <- param_job(idf = model, epw = epw_sf)

param

## ----mea, eval = can_run-------------------------------------------------
set_infil_rate <- function (idf, infil_rate) {

    # validate input value
    # this is optional, as validations will be performed when setting values
    stopifnot(is.numeric(infil_rate), infil_rate >= 0)

    if (!idf$is_valid_class("ZoneInfiltration:DesignFlowRate"))
      stop("Input model does not have any object in class `ZoneInfiltration:DesignFlowRate`")

    ids <- idf$object_id("ZoneInfiltration:DesignFlowRate", simplify = TRUE)

    idf$set_object(ids,
        value = rep(list(list(
            design_flow_rate_calculation_method = "AirChanges/Hour",
            air_changes_per_hour = infil_rate)),
            times = length(ids))
        )

    idf
}

## ----apply, eval = can_run-----------------------------------------------
param$apply_measure(set_infil_rate, seq(0, 4, by = 1), .names = NULL)

## ----param_run, eval = can_run-------------------------------------------
param$run()

## ----param_res, eval = can_run-------------------------------------------
tab <- param$tabular_data()

total_eng <- tab[TableName == "Site and Source Energy" &
    ColumnName == "Total Energy" &
    RowName == "Total Site Energy",
    list(Case, `Total Energy (GJ)` = as.numeric(Value))]

## ----eval = FALSE--------------------------------------------------------
#  total_eng

## ----echo = FALSE, results="asis", eval = can_run------------------------
knitr::kable(total_eng)

## ----del_param, include = FALSE, eval = can_run--------------------------
dir_nms <- paste0("set_infil_rate_", 1:5)
lapply(dir_nms, unlink, recursive = TRUE, force = TRUE)

## ----clean_files, include = FALSE, eval = can_run------------------------
unlink(file.path(tempdir(), c(example_name, "San_Francisco.epw", "San_Francisco.ddy")))

