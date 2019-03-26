context("knn function input check")

test_that("error when input data is not data frame", {

  set.seed(564898)
  feat1 <- c(3.3,0.1,2.3)
  cat_tar <- c("a","b","a")
  
  dat <- data.frame(feat1,cat_tar)
  
  train_set <- dat[1:2,]
  test_set <- dat[3,1]
  
  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   comparison_measure="euclidean"),"train_set and test_set must be data frames")
  
  test_set <- dat[1:2,]
  train_set <- dat[3,1:2]
  
  expect_error(knn(train_set=c(1,2,3),test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   comparison_measure="squared_euclidean"),"train_set and test_set must be data frames")
})


test_that("error when input data has NA elements", {

  set.seed(564)
  feat1 <- c(NA,0.1,2.3)
  feat2 <- c(4.5,6.7,3)
  cat_tar <- c("a","b","a")

  dat <- data.frame(feat1,feat2,cat_tar)

  train_set <- dat[1:2,]
  test_set <- dat[3,1:2]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   comparison_measure="euclidean"),"missing values not allowed in train_test or test_set")

  test_set <- dat[1:2,]
  train_set <- dat[3,1:2]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   comparison_measure="squared_euclidean"),"missing values not allowed in train_test or test_set")
})


test_that("error when a specified target is not present in train_set", {

  set.seed(321)

  n_dat_rows <- 7
  feat1 <- c(1,1,0,0,0,0,0)
  feat2 <- c(0,0,1,1,0,1,0)
  cat_tar <- c("green","red","green","green","red","green","green")
  cont_tar <- c(0.9898785,0.9311740,0.4855048,0.5746893,0.7512382,0.9927224,0.4308644)
  
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,cat_tar,cont_tar,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1","feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
             k=3,
             categorical_target="cat_tar",
             continuous_target="STRANGE_TARGET",
             comparison_measure="jaccard",
             return_ranked_neighbors=3,
             id="ID"),"all specified targets \\(categorical, continuous, and/or id\\) must be present in train_set")
})


test_that("error when features in train_set and test_set are not in same order",{

  set.seed(5745)

  n_dat_rows <- 7
  
  feat1 <- c(0,0,0,1,0,1,1)
  feat2 <- c(1,1,1,0,1,0,0)
  cat_tar <- c("red","blue","blue","green","red","blue","green")
  cont_tar <- c(0.6081487,0.5659303,0.1393931,0.5678338,0.1878581,0.5548865,0.1013847)
  
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,cat_tar,cont_tar,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat2","feat1")] #change feature order

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   continuous_target="cont_tar",
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"features and column order in test_set must match those in train_set")
})


test_that("error when some features in train_set are not included in test_set",{

  set.seed(545)

  n_dat_rows <- 9

  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  feat3 <- c(1,0,0,1,0,0,1,1,1)
  cat_tar <- c("red","green","blue","green","green","green","green","red","red")
  cont_tar <- c(0.9200511,0.8416001,0.8538682,0.3471011,0.7454319,0.7817555,0.6176841,0.8104446,0.7499481)
  
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,feat3,cat_tar,cont_tar,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")] #exclude feat3

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   continuous_target="cont_tar",
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"features and column order in test_set must match those in train_set")
})


test_that("error when return_ranked_neighbors is non-zero and id is not specified",{

  set.seed(5451)
  n_dat_rows <- 5

  feat1 <- c(0,1,1,1,0)
  feat2 <- c(0,0,1,0,0)
  cat_tar <- c("green","red","blue","blue","red")
  cont_tar <- c(0.2515468,0.6100825,0.2753270,0.3780903,0.9969264)
  
  dat <- data.frame(feat1,feat2,cat_tar,cont_tar)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   continuous_target="cont_tar",
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3),"if return_ranked_neighbors > 0, id column must be specified")
})


test_that("error when id return_ranked_neighbors is less than zero",{
  set.seed(1111)
  n_dat_rows <- 5
  
  feat1 <- c(0,1,1,1,0)
  feat2 <- c(0,0,1,0,0)
  cat_tar <- c("green","red","blue","blue","red")
  cont_tar <- c(0.2515468,0.6100825,0.2753270,0.3780903,0.9969264)

  dat <- data.frame(feat1,feat2,cat_tar,cont_tar)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   continuous_target="cont_tar",
                   comparison_measure="jaccard",
                   return_ranked_neighbors=-1),"return_ranked_neighbors must be 0 or greater")
})


test_that("error when target is not specified and return_ranked_neighbors is not greater than 0",{
  set.seed(5678545)

  n_dat_rows <- 9
  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  feat3 <- c(1,0,0,1,0,0,1,1,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,feat3,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2", "feat3")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=0,
                   id="ID"),"specify a target or set return_ranked_neighbors to greater than 0")
})


test_that("error when ID in train_set is not unique",{
  set.seed(7105)

  n_dat_rows <- 7
  feat1 <- c(0,0,1,1,0,0,1)
  feat2 <- c(0,0,1,1,1,0,1)
  ID <- c(1,1,1,0,1,1,1)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=1,
                   comparison_measure="simple_matching",
                   return_ranked_neighbors=3,
                   id="ID"),"id column in train_set must be unique")
})


test_that("error if return_ranked_neighbors <= k",{
  set.seed(112233)

  n_dat_rows <- 5
  feat1 <- c(0,1,1,1,0)
  feat2 <- c(0,0,1,0,0)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="simple_matching",
                   return_ranked_neighbors=4,
                   id="ID"),"return_ranked_neighbors must not be more than k")
  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=1,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=2,
                   id="ID"),"return_ranked_neighbors must not be more than k")
})


test_that("error if categorical scoring method is not allowed",{
  set.seed(2323211)

  n_dat_rows <- 9
  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   categorical_scoring_method = "strange_method_name",
                   id="ID"),"is not an allowed categorical scoring method")
})


test_that("error if continuous scoring method is not allowed",{
  set.seed(2423211)

  n_dat_rows <- 9
  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   continuous_scoring_method = "strange_method_name",
                   id="ID"),"is not an allowed continuous scoring method")
})


test_that("error if distance or similarity measure is not allowed",{
  set.seed(562344)
  feat1 <- c(7,0.1,2.3)
  feat2 <- c(4.5,6.7,3)
  cat_tar <- c("a","b","a")

  dat <- data.frame(feat1,feat2,cat_tar)

  train_set <- dat[1:2,]
  test_set <- dat[3,1:2]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   categorical_target="cat_tar",
                   comparison_measure="strange_measure"),"is not an allowed distance or similarity measure")
})


test_that("error if train_set or test_set features contain factors",{
  set.seed(3030)

  n_dat_rows <- 9
  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  train_set$feat1 <- as.factor(train_set$feat1)

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"train_set and test_set must not contain factors")

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  test_set$feat1 <- as.factor(test_set$feat1)

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"train_set and test_set must not contain factors")
})


test_that("error if comparison measure is similarity and all train_set features are not in {1,0}",{
  set.seed(24991)

  n_dat_rows <- 9
  feat1 <- c(0,2,2,3,1,2,1,1,2)
  feat2 <- c(0,1,0,1,1,1,0,0,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"if using a similarity measure, all train_set features must consist of {0,1}")
})


test_that("error if comparison measure is similarity and all test_set features are not in {1,0}",{
  set.seed(24091)

  n_dat_rows <- 9
  feat1 <- c(1,1,1,0,0,1,0,0,0)
  feat2 <- c(1,0,1,1,1,1,1,0,1)
  ID <- c(1:n_dat_rows)

  dat <- data.frame(feat1,feat2,ID)

  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]
  test_set$feat1[1] <- -4

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),"if using a similarity measure, all test_set features must consist of {0,1}")
})



test_that("no error when input features are logical", {
  set.seed(2403317)
  
  n_dat_rows <- 9
  feat1 <- c(TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE)
  feat2 <- c(TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE)
  ID <- c(1:n_dat_rows)
  
  dat <- data.frame(feat1,feat2,ID)
  
  train_set <- dat[1:(n_dat_rows-2),]
  test_set <- dat[n_dat_rows,c("feat1", "feat2")]

  expect_error(knn(train_set=train_set,test_set=test_set,
                   k=3,
                   comparison_measure="jaccard",
                   return_ranked_neighbors=3,
                   id="ID"),NA)
})