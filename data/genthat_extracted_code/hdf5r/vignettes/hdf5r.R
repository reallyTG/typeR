## ---- include=FALSE, eval=TRUE-------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=7, tidy=TRUE, results="hold")

## ------------------------------------------------------------------------
library(hdf5r)
test_filename <- tempfile(fileext=".h5")
file.h5 <- H5File$new(test_filename, mode="w")
file.h5

## ------------------------------------------------------------------------
mtcars.grp <- file.h5$create_group("mtcars")
flights.grp <- file.h5$create_group("flights")

## ------------------------------------------------------------------------
library(datasets)
library(nycflights13)
library(reshape2)
mtcars.grp[["mtcars"]] <- datasets::mtcars
flights.grp[["weather"]] <- nycflights13::weather
flights.grp[["flights"]] <- nycflights13::flights

## ------------------------------------------------------------------------
weather_wind_dir <- subset(nycflights13::weather, origin=="EWR", select=c("year", "month", "day", "hour", "wind_dir"))
weather_wind_dir <- na.exclude(weather_wind_dir)
weather_wind_dir$wind_dir <- as.integer(weather_wind_dir$wind_dir)
weather_wind_dir <- acast(weather_wind_dir, year + month + day ~ hour, value.var="wind_dir")
flights.grp[["wind_dir"]] <- weather_wind_dir

## ------------------------------------------------------------------------
weather_wind_speed <- subset(nycflights13::weather, origin=="EWR", select=c("year", "month", "day", "hour", "wind_speed"))
weather_wind_speed <- na.exclude(weather_wind_speed)
weather_wind_speed <- acast(weather_wind_speed, year + month + day ~ hour, value.var="wind_speed")
flights.grp[["wind_speed"]] <- weather_wind_speed

## ------------------------------------------------------------------------
h5attr(flights.grp[["wind_dir"]], "colnames") <- colnames(weather_wind_dir)
h5attr(flights.grp[["wind_dir"]], "rownames") <- rownames(weather_wind_dir)
h5attr(flights.grp[["wind_speed"]], "colnames") <- colnames(weather_wind_speed)
h5attr(flights.grp[["wind_speed"]], "rownames") <- rownames(weather_wind_speed)

## ---- results="markup"---------------------------------------------------
names(file.h5)
names(flights.grp)

## ------------------------------------------------------------------------
flights.grp$ls()

## ---- results="markup"---------------------------------------------------
weather_ds <- flights.grp[["weather"]]
weather_ds_type <- weather_ds$get_type()
weather_ds_type$get_class()
cat(weather_ds_type$to_text())

## ------------------------------------------------------------------------
weather_ds$dims
weather_ds$maxdims
weather_ds$chunk_dims

## ------------------------------------------------------------------------
h5attr_names(flights.grp[["wind_dir"]])

## ------------------------------------------------------------------------
h5attr(flights.grp[["wind_dir"]], "colnames")

## ---- results="markup"---------------------------------------------------
weather_ds[1:5]
wind_dir_ds <- flights.grp[["wind_dir"]]
wind_dir_ds[1:3,]

## ------------------------------------------------------------------------
wind_dir_ds[1,] <- rep(1, 24)
wind_dir_ds[1,]

## ---- results="markup"---------------------------------------------------
wind_dir_ds$get_fill_value()	
wind_dir_ds[1, 25] <- 1
wind_dir_ds[1:2, ]

## ------------------------------------------------------------------------
flights.grp$link_delete("wind_dir")
flights.grp$ls()

## ---- eval=FALSE---------------------------------------------------------
#  file.h5$close_all()

## ------------------------------------------------------------------------
uint2_dt <- h5types$H5T_NATIVE_UINT32$set_size(1)$set_precision(2)$set_sign(h5const$H5T_SGN_NONE)

## ------------------------------------------------------------------------
space_ds <- H5S$new(dims=c(10,10), maxdims=c(Inf, 10))

## ------------------------------------------------------------------------
ds_create_pl_nbit <- H5P_DATASET_CREATE$new()
ds_create_pl_nbit$set_chunk(c(10,10))$set_fill_value(uint2_dt, 1)$set_nbit()

## ------------------------------------------------------------------------
uint2.grp <- file.h5$create_group("uint2")
uint2_ds_nbit <- uint2.grp$create_dataset(name="nbit_filter", space=space_ds, dtype=uint2_dt, dataset_create_pl=ds_create_pl_nbit,
                                          chunk_dim=NULL, gzip_level=NULL)
uint2_ds_nbit[,] <- sample(0:3, size=100, replace=TRUE)
uint2_ds_nbit$get_storage_size()

## ------------------------------------------------------------------------
ds_create_pl_nbit_deflate <- ds_create_pl_nbit$copy()$set_deflate(9)
ds_create_pl_deflate <- ds_create_pl_nbit$copy()$remove_filter()$set_deflate(9)
ds_create_pl_none <- ds_create_pl_nbit$copy()$remove_filter()
uint2_ds_nbit_deflate <- uint2.grp$create_dataset(name="nbit_deflate_filter", space=space_ds, dtype=uint2_dt,
                                                  dataset_create_pl=ds_create_pl_nbit_deflate, chunk_dim=NULL, gzip_level=NULL)
uint2_ds_nbit_deflate[,] <- uint2_ds_nbit[,]
uint2_ds_deflate <- uint2.grp$create_dataset(name="deflate_filter", space=space_ds, dtype=uint2_dt, dataset_create_pl=ds_create_pl_deflate,
                                          chunk_dim=NULL, gzip_level=NULL)
uint2_ds_deflate[,] <- uint2_ds_nbit[,]
uint2_ds_none <- uint2.grp$create_dataset(name="none_filter", space=space_ds, dtype=uint2_dt, dataset_create_pl=ds_create_pl_none,
                                          chunk_dim=NULL, gzip_level=NULL)
uint2_ds_none[,] <- uint2_ds_nbit[,]

## ------------------------------------------------------------------------
uint2_ds_nbit_deflate$get_storage_size()
uint2_ds_nbit$get_storage_size()
uint2_ds_deflate$get_storage_size()
uint2_ds_none$get_storage_size()

## ------------------------------------------------------------------------
str_fixed_len <- H5T_STRING$new(size=20)
str_var_length <- H5T_STRING$new(size=Inf)

## ------------------------------------------------------------------------
enum_example <- H5T_ENUM$new(c("Label 1", "Label 2", "Label 3"), values=c(-3, 5, 10))

## ------------------------------------------------------------------------
enum_example$get_labels()
enum_example$get_values()

## ------------------------------------------------------------------------
enum_example$get_super()

## ------------------------------------------------------------------------
logical_example <- H5T_LOGICAL$new(include_NA=TRUE)
## we could also use h5types$H5T_LOGICAL  or h5types$H5T_LOGICAL_NA
logical_example$get_labels()
logical_example$get_values()

## ------------------------------------------------------------------------
cpd_example <- H5T_COMPOUND$new(c("Double_col", "Int_col", "Logical_col"), dtypes=list(h5types$H5T_NATIVE_DOUBLE, h5types$H5T_NATIVE_INT,
                                                                               logical_example))

## ---- results="markup"---------------------------------------------------
cpd_example$get_cpd_labels()
cpd_example$get_cpd_classes()
cpd_example$get_cpd_types()

## ------------------------------------------------------------------------
cat(cpd_example$to_text())

## ------------------------------------------------------------------------
cplx_example <- H5T_COMPLEX$new()
cplx_example$get_cpd_labels()
cplx_example$get_cpd_classes()

## ------------------------------------------------------------------------
array_example <- H5T_ARRAY$new(dims=c(3,4), dtype_base=h5types$H5T_NATIVE_INT)
cpd_several <- H5T_COMPOUND$new(c("STRING_fixed", "Double", "Complex", "Array"),
                                dtypes=list(str_fixed_len, h5types$H5T_NATIVE_DOUBLE, cplx_example, array_example))
cat(cpd_several$to_text())                                                                                 

## ------------------------------------------------------------------------
obj_empty <- create_empty(1, cpd_several)
obj_empty
obj_empty$Array

## ------------------------------------------------------------------------
vlen_example <- H5T_VLEN$new(dtype_base=cpd_several)

## ---- eval=TRUE, FALSE, include=FALSE------------------------------------
file.h5$close_all()

