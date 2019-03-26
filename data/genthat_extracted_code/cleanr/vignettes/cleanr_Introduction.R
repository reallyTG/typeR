## ---- echo = FALSE-------------------------------------------------------
cleanr::set_cleanr_options(reset = TRUE)

## ------------------------------------------------------------------------
path <- system.file("tests", "runit", "wrappers.r", package = "cleanr")
print(cleanr::check_file_layout(path))

## ------------------------------------------------------------------------
cleanr::get_cleanr_options(flatten_list = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  cleanr::check_file_layout(path, max_file_width = 79)

## ------------------------------------------------------------------------
print(tools::assertCondition(cleanr::check_file_layout(path, 
                                                     max_file_width = 79), 
                             c("cleanr", "error",  "condition"))
)

## ------------------------------------------------------------------------
cleanr::set_cleanr_options(max_file_width = 75, 
                           max_file_length = 20)

## ------------------------------------------------------------------------
print(tools::assertCondition(cleanr::check_file_layout(path), 
                             c("cleanr", "error",  "condition"))
)

## ------------------------------------------------------------------------
cleanr::set_cleanr_options(reset = TRUE)
path <- system.file("source", "R", "checks.R", package = "cleanr")
print(cleanr::check_file_layout(path)) 

## ------------------------------------------------------------------------
print(tools::assertCondition(cleanr::check_file_layout(path, 
                                                       max_file_length = 100), 
                             c("cleanr", "error",  "condition"))
)

## ------------------------------------------------------------------------
print(suppressWarnings(cleanr::check_functions_in_file(path)))

## ------------------------------------------------------------------------
print(tools::assertCondition(suppressWarnings(cleanr::check_functions_in_file(path,
                                                                        max_num_arguments = 1)), 
                       c("cleanr", "error",  "condition"))
)

## ------------------------------------------------------------------------
print(suppressWarnings(cleanr::check_file(path)))

## ------------------------------------------------------------------------
path <- system.file("tests", "runit", package = "cleanr")
print(suppressWarnings(cleanr::check_directory(path,
                                               check_return = FALSE)))

## ------------------------------------------------------------------------
path <- system.file("source", "R", package = "cleanr")
cleanr::load_internal_functions("cleanr")
print(tools::assertCondition(suppressWarnings(cleanr::check_directory(path)), 
                       c("cleanr", "error",  "condition"))
)

## ------------------------------------------------------------------------
cleanr::set_cleanr_options(reset = TRUE)
cleanr::load_internal_functions("cleanr")
path <- system.file("source", "R", "wrappers.R", package = "cleanr")

# will produce a condition:
r <- tools::assertCondition(cleanr::check_functions_in_file(path, 
                                                            check_return = FALSE),
                            c("cleanr", "error",  "condition"))
print(r)
# set argument to disable the check causing the condition:
r <- cleanr::check_functions_in_file(path, check_return = FALSE, 
                                     max_num_arguments = FALSE)
print(r)

## ------------------------------------------------------------------------
co <- get_cleanr_options(flatten_list = FALSE)
co <- lapply(co, function(x) x == FALSE)
options("cleanr" = list(cleanr = co))
get_cleanr_options() 

## ------------------------------------------------------------------------
path <- system.file("source", "R", package = "cleanr")
cleanr::load_internal_functions("cleanr")
print(cleanr::check_directory(path)) 

