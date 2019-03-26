library(nmslibR)


### Name: NMSlib
### Title: Non metric space library
### Aliases: NMSlib
### Keywords: datasets

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("nmslib")) {

  library(nmslibR)

  set.seed(1)
  x = matrix(runif(1000), nrow = 100, ncol = 10)

  init_nms = NMSlib$new(input_data = x)


  # returns a 1-dimensional vector (index, distance)
  #--------------------------------------------------

  init_nms$Knn_Query(query_data_row = x[1, ], k = 5)


  # returns knn's for all data
  #---------------------------

  all_dat = init_nms$knn_Query_Batch(x, k = 5, num_threads = 1)

}



