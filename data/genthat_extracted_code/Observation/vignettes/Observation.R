## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example, eval = FALSE-----------------------------------------------
#  
#  # First, you need to "attach" the package. You can think of this as loading it.
#  # This step is technically optional, but to use the package functions without
#  # it, you need to write "Observation::" before each command, e.g.
#  # "Observation::data_collection_program()"
#  
#  library(Observation)
#  
#  # Now it's time to run the Observation program, which will guide you through the
#  # data collection process described by Hibbing et al. (2018).
#  
#  # data_collection_program()
#    # ^This only runs the program, but does not store the data.
#    # You will want to define an object that stores the data you collect.
#    # To do so, you provide the name ("my_data") and use the "<-" operator
#    # to assign the results of data_collection_program() to an object of
#    # that name.
#  
#  my_data <- data_collection_program()
#  
#  # You can view your work with
#  
#  View(my_data)
#  
#  # There is also a sample data set you can examine with
#  
#  data(example_data, package = "Observation")
#  View(example_data)
#  
#  # The format of "my_data" and "example_data" (and any other data
#  # collected with data_collection_program()) will be the same. Information
#  # about what each column represents is available with
#  
#  help(example_data, package = "Observation")
#  
#  # Once you are finished collecting data, you should save it to an external file.
#  # There are a lot of options both for saving in different formats, and for
#  # managing data from multiple participants. However, this vignette is not
#  # intended as a tutorial for those types of tasks, and you probably already
#  # have a system you would rather use at that level. Thus, a minimal example is
#  # provided here, and the work of determining the appropriate management scheme
#  # for a given study is left to the reader.
#  
#  write.csv(my_data, file = "My Example Observation Data.csv", row.names = FALSE)
#  
#  # Naturally, you should change the filename in the above code to suit your
#  # needs, and be careful to change the filename each time you run your code, to
#  # avoid overwriting previously-collected data files. You can easily automate the
#  # data saving process to avoid hazards, but again, that is beyond the scope of
#  # this vignette.
#  
#  # Next, it is time to process the data, again via the scheme described by
#  # Hibbing et al. (2018), in reference to the Compendium of Physical Activities.
#  # As before, you need to assign the processed data to an object via "<-",
#  # which has been named "my_data_processed" below.
#  
#  my_data_processed <- compendium_reference(my_data)
#  
#  # You can save this processed data with similar code as given above.
#  
#  write.csv(my_data_processed, file = "My Example_Processed.csv", row.names = FALSE)
#  

## ----development, eval = FALSE-------------------------------------------
#  
#  if (!"devtools" %in% installed.packages()) install.packages("devtools")
#  
#  devtools::install_github("SciViews/svDialogs")
#  # ^ This installs the official development version, which has accepted some
#  # specific changes I made to make using `Observation` more pleasant. As a
#  # development version, it may be changing continually in ways that could
#  # potentially affect `Observation`. If you're not pleased with the behavior
#  # you're getting, you can try installing my personal copy, since I'm not
#  # planning to continue contributing to development for `svDialogs`.
#  
#  # devtools::install_github("paulhibbing/svDialogs")
#  

## ----customize, eval = FALSE---------------------------------------------
#  
#  library(Observation)
#  data(example_data, package = "Observation")
#  compendium_reference(example_data, rstudio = FALSE)
#  

