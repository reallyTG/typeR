## ----basic, eval = FALSE-------------------------------------------------
#  # load the package
#  library(fmriqa)
#  
#  # get help on the options for run_fmriqa
#  ?run_fmriqa
#  
#  # run the analysis - a file chooser will appear when a data_file argument is not given
#  run_fmriqa()

## ----real_data, eval = TRUE----------------------------------------------
library(fmriqa)
fname <- system.file("extdata", "qa_data.nii.gz", package = "fmriqa")
res <- run_fmriqa(data_file = fname, gen_png = FALSE, gen_res_csv = FALSE, tr = 3)

