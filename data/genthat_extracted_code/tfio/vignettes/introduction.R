## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  library(tfio)
#  dataset <- sequence_file_dataset("R-package/tests/testthat/testdata/string.seq") %>%
#      dataset_repeat(2)
#  
#  sess <- tf$Session()
#  iterator <- make_iterator_one_shot(dataset)
#  next_batch <- iterator_get_next(iterator)
#  
#  until_out_of_range({
#    batch <- sess$run(next_batch)
#    print(batch)
#  })

