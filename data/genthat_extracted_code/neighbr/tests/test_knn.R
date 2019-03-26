context("knn function")

test_that("knn with jaccard object contains expected items - 1", {

  set.seed(456)
  n_dat_rows <- 10

  feat1 <- c(0,0,1,1,1,0,0,0,0,0)
  feat2 <- c(0,0,1,1,1,1,1,0,1,0)
  feat3 <- c(0,1,1,0,1,1,1,1,0,0)
  cat_tar <- c("orange","red","orange","green","green","orange","orange","orange","orange","green")
  cont_tar <- c(0.31753470,0.42369873,0.04296139,0.12927385,0.07681441,
                0.07841957,0.58247762,0.54410322,0.48570649,0.92824613)
  
  ID <- c(1:n_dat_rows)
  
  dat <- data.frame(feat1,feat2,feat3,cat_tar,cont_tar,ID)
  
  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1","feat2","feat3")]
  
  fit <- knn(train_set=train_set,test_set=test_set,
             k=2,
             categorical_target="cat_tar",
             continuous_target="cont_tar",
             comparison_measure="jaccard",
             return_ranked_neighbors=2,
             id="ID")
  
  expect_equal(dim(summary(fit))[1],16) #expect fit to have 16 items
  expect_equal(deparse(fit$call),c("knn(train_set = train_set, test_set = test_set, k = 2, categorical_target = \"cat_tar\", ",
                                   "    continuous_target = \"cont_tar\", comparison_measure = \"jaccard\", ",
                                   "    return_ranked_neighbors = 2, id = \"ID\")"))
  expect_equal(fit$k,2)
  expect_equal(fit$categorical_target,"cat_tar")
  expect_equal(fit$continuous_target,"cont_tar")
  expect_equal(fit$comparison_measure,"jaccard")
  expect_equal(fit$categorical_scoring_method,"majority_vote")
  expect_equal(fit$continuous_scoring_method,"average")
  expect_equal(fit$return_ranked_neighbors,2)
  expect_equal(fit$id,"ID")
  expect_equal(fit$features,c("feat1","feat2","feat3"))
  expect_equal(fit$function_name,"mixed")
  expect_equal(fit$categorical_levels,c("green","orange","red"))
  expect_equal(fit$num_train_rows,8)
  expect_equal(fit$num_test_rows,1)
  expect_equal(fit$train_set$feat1,c(0,0,1,1,1,0,0,0))
  expect_equal(fit$train_set$feat2,c(0,0,1,1,1,1,1,0))
  expect_equal(fit$train_set$feat3,c(0,1,1,0,1,1,1,1))
  expect_equal(fit$test_set_scores$categorical_target,"orange")
  expect_equal(fit$test_set_scores$continuous_target,0.23333005653694272041)
  expect_equal(fit$test_set_scores$neighbor1,2)
  expect_equal(fit$test_set_scores$neighbor2,3)
})

test_that("knn with jaccard object contains expected items - 2", {

  set.seed(123)
  n_dat_rows <- 10

  feat1 <- c(0,1,0,1,1,0,1,1,1,0)
  feat2 <- c(1,0,1,1,0,1,0,0,0,1)
  feat3 <- c(1,1,1,1,1,1,1,1,0,0)
  cat_tar <- c("blue","blue","blue","blue","red","green","blue","red","red","red")
  cont_tar <- c(0.1428000,0.4145463,0.4137243,0.3688455,0.1524447,
                0.1388061,0.2330341,0.4659625,0.2659726,0.8578277)
  
  
  ID <- c(1:n_dat_rows)

  # dat <- data.frame(feat1,feat2,feat3,ID)
  dat <- data.frame(feat1,feat2,feat3,cat_tar,cont_tar,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1","feat2","feat3")]

  fit <- knn(train_set=train_set,test_set=test_set,
             k=3,
             categorical_target="cat_tar",
             continuous_target="cont_tar",
             comparison_measure="jaccard",
             return_ranked_neighbors=3,
             id="ID")


  expect_equal(names(fit$test_set_scores),c("categorical_target","continuous_target","neighbor1","neighbor2","neighbor3"))

  expect_equal(fit$test_set_scores$categorical_target,"blue")
  expect_equal(fit$test_set_scores$continuous_target,0.231776804042359202418)
  expect_equal(fit$test_set_scores$neighbor1,1)
  expect_equal(fit$test_set_scores$neighbor2,3)
  expect_equal(fit$test_set_scores$neighbor3,6)
})

test_that("knn euclidean clustering object contains expected items", {
  set.seed(334455)
  n_dat_rows <- 27
  
  feat1 <- c(0.92455564,0.74938855,0.80555177,0.60259363,0.82257151,0.11199052,
             0.90359708,0.37341714,0.26986599,0.93062594,0.67182929,0.35344112,
             0.79498825,0.10744474,0.49529769,0.27766731,0.69180392,0.10796525,
             0.85859162,0.89878006,0.86419524,0.55533624,0.51522158,0.62078923,
             0.65602609,0.82661748,0.03848525)
  feat2 <- c(0.54420303,0.78990096,0.17005190,0.83872097,0.88093331,0.41242678,
             0.58231761,0.86189998,0.95442618,0.13474694,0.83608545,0.86419985,
             0.50778279,0.07543578,0.70951347,0.03377456,0.93787590,0.98786686,
             0.95397011,0.99186118,0.84321269,0.74014652,0.69499037,0.16801342,
             0.56200532,0.40281416,0.72523906)
  
  the_id_variable <- c(1:n_dat_rows)
  
  dat <- data.frame(feat1,feat2,the_id_variable)
  
  train_set <- dat[1:(n_dat_rows-10),]
  test_set <- dat[(n_dat_rows-5):n_dat_rows,c("feat1","feat2")]
  
  fit <- knn(train_set=train_set,test_set=test_set,
             k=5,
             comparison_measure="euclidean",
             return_ranked_neighbors=3,
             id="the_id_variable")
  
  expect_equal(dim(summary(fit))[1],16) #expect fit to have 16 items
  expect_equal(deparse(fit$call),c("knn(train_set = train_set, test_set = test_set, k = 5, comparison_measure = \"euclidean\", ",
                                   "    return_ranked_neighbors = 3, id = \"the_id_variable\")"))
  expect_equal(fit$k,5)
  expect_equal(fit$categorical_target,NULL)
  expect_equal(fit$continuous_target,NULL)
  expect_equal(fit$comparison_measure,"euclidean")
  expect_equal(fit$categorical_scoring_method,"majority_vote")
  expect_equal(fit$continuous_scoring_method,"average")
  expect_equal(fit$return_ranked_neighbors,3)
  expect_equal(fit$id,"the_id_variable")
  expect_equal(fit$features,c("feat1","feat2"))
  expect_equal(fit$function_name,"clustering")
  expect_equal(fit$categorical_levels,NULL)
  expect_equal(fit$num_train_rows,17)
  expect_equal(fit$num_test_rows,6)
  expect_equal(dim(fit$test_set_scores),c(6,3))
  expect_equal(fit$test_set_scores$neighbor1,c(15,15,3,13,13,6))
  expect_equal(fit$test_set_scores$neighbor2,c(4,4,10,15,1,9))
  expect_equal(fit$test_set_scores$neighbor3,c(11,11,16,2,7,12))
})

