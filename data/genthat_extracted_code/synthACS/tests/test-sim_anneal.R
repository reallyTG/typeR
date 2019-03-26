
library(testthat)
library(synthACS)

#----------------------------------------------------------
context("adding constraints")
#----------------------------------------------------------

test_that("constraint errors work", {
  # geography
  diamonds <- data.frame(
    carat= rexp(100),
    cut= factor(sample(c("A", "B", "C"), size= 100, replace= TRUE)),
    x= runif(100, min= 0, max= 10),
    y= runif(100, min= 0, max= 10),
    x= runif(100, min= 0, max= 10)
  )
  let <- letters
  
  # errors:
  expect_error(add_constraint(attr_name= "variable", attr_totals= a, micro_data= test_micro))
  expect_error(add_constraint(attr_name= "age", attr_totals= a, micro_data= diamonds))
  expect_error(add_constraint(attr_name= "age", attr_totals= let, micro_data= test_micro))
  expect_error(add_constraint(attr_name= "age", attr_totals= rnorm(20), micro_data= test_micro))
  expect_error(add_constraint(attr_name= "age", attr_totals= {b <- a; names(b) <- NULL;b}, micro_data= test_micro))
  
})


test_that("adding constraints work", {
  # test -- add some constraints singly
  expect_true(is.list(add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)))
  expect_equal(length(add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)), 1)
  expect_equal(names(add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)), "age")
  
  expect_true(is.list(add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro)))
  expect_equal(length(add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro)), 1)
  expect_equal(names(add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro)), "edu_attain")
  
  expect_true(is.list(add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro)))
  expect_equal(length(add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro)), 1)
  expect_equal(names(add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro)), "gender")
  
  # test -- add multiple constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  expect_equal(length(add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                                     constraint_list= c_list)), 2L)
  expect_equal(names(add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                                     constraint_list= c_list)), c("age", "edu_attain"))
  
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  
  expect_equal(length(c_list), 4)
  expect_true(is.list(c_list))
  expect_equal(names(c_list), c("age", "edu_attain", "gender", "nativity"))
  expect_true(all(names(c_list) %in% names(test_micro)))
  expect_equal(sum(c_list[[1]]), sum(c_list[[2]]))
  expect_equal(sum(c_list[[1]]), sum(c_list[[3]]))
  expect_equal(sum(c_list[[1]]), sum(c_list[[4]]))
  
})

#----------------------------------------------------------
context("calculating TAE - helpers")
#----------------------------------------------------------

test_that("sample_totals calculates accurately", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  
  st <- synthACS:::sample_totals(names(c_list), samp)
  
  expect_equal(st[[1]], table(samp$age))
  expect_equal(st[[2]], table(samp$edu_attain))
  expect_equal(st[[3]], table(samp$gender))
  expect_equal(st[[4]], table(samp$nativity))  
})

test_that("tae_mapply calculates accurately", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  # sample data and run
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  t1 <- synthACS:::tae_mapply(synthACS:::sample_totals(names(c_list), samp),
                              c_list)
  
  # test output -- values
  tae_age <- sum(abs(table(samp$age) - a)) # 3098
  tae_edu <- sum(abs(table(samp$edu_attain) - e)) # 3266
  
  expect_equal(sum(t1), sum(3098, 3266))
  expect_equal(sum(t1), sum(tae_age, tae_edu))
  expect_equal(t1[1], tae_age)
  expect_equal(t1[2], tae_edu)
})

#----------------------------------------------------------
context("calculating TAE")
#----------------------------------------------------------

test_that("tae errors work appropriately", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  
  c_list2 <- add_constraint(attr_name= "age", attr_totals= a * 2, micro_data= test_micro)
  # sample data
  set.seed(235L)
  mm <- matrix(rnorm(100), 10)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  
  # create some errors:
  expect_error(calculate_TAE(mm, c_list))
  expect_error(calculate_TAE(samp, c_list2))
  expect_error(calculate_TAE(samp, c_list, mm))
  
})

test_that("TAE results are exactly correct", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  
  # sample data and run
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  t1 <- calculate_TAE(samp, c_list)
  
  # test output -- values
  tae_age <- sum(abs(table(samp$age) - a)) # 3098
  tae_edu <- sum(abs(table(samp$edu_attain) - e)) # 3266
  
  expect_equal(t1[[1]], sum(3098, 3266))
  expect_equal(t1[[1]], sum(tae_age, tae_edu))
  
  ## add another constraint, retest
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  t1 <- calculate_TAE(samp, c_list)
  
  tae_g <- sum(abs(table(samp$gender) - g)) # 1106
  expect_equal(t1[[1]], sum(3098, 3266, 1106))
  expect_equal(t1[[1]], sum(tae_age, tae_edu, tae_g))
  
})


test_that("TAE ouptuts appropriately - no iterations", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  # sample data and run
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  t1 <- calculate_TAE(samp, c_list)
  # test output -- attributes
  expect_true(is.list(t1))
  expect_true(length(t1) == 2)
  expect_true(is.numeric(t1[[1]]))
  expect_true(all(unlist(lapply(t1[[2]], is.numeric))))
  expect_equal(length(t1[[2]]), length(c_list))
  expect_true(all.equal(sapply(c_list, names), sapply(t1[[2]], names), check.attributes = FALSE))
  
})

test_that("TAE results are exactly correct - iterations 2-3", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  # sample data and run
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  t1 <- calculate_TAE(samp, c_list)
  
  expect_equal(t1[[1]], sum(3098, 3266, 1106))
  
  # take a resample
  drop_ind <- sample(1:nrow(samp), size= 500, replace=FALSE)
  new_obs  <- synthACS:::sample_micro(test_micro, 500, prob_name= "p")  
  drop_totals <- synthACS:::sample_totals(names(c_list), samp[drop_ind,])
  
  t2 <- calculate_TAE(samp, c_list,
                      prior_sample_totals= t1[[2]],
                      dropped_obs_totals= drop_totals,
                      new_obs= new_obs)
  
  # hand calc correct outputs
  new_samp <- rbind(samp[-drop_ind,], new_obs)
  st <- synthACS:::sample_totals(names(c_list), new_samp)
  
  tae_age <- sum(abs(table(new_samp$age) - a)) # 3094
  tae_edu <- sum(abs(table(new_samp$edu_attain) - e)) # 3250
  tae_g   <- sum(abs(table(new_samp$gender) - g)) # 1086
  
  # test output -- exact counts
  #----------------------------------------------
  expect_equal(t2[[1]], sum(tae_age, tae_edu, tae_g))
  expect_equal(t2[[1]], sum(3094, 3250, 1086))
  expect_equal(st[[1]], t2[[2]][[1]])
  expect_equal(st[[2]], t2[[2]][[2]])
  expect_equal(st[[3]], t2[[2]][[3]])
  
  # test output -- vs non iterating
  t3 <- calculate_TAE(new_samp, c_list)
  expect_equal(t2,t3)
  
  # take a resample
  #----------------------------------------------
  drop_ind <- sample(1:nrow(new_samp), size= 500, replace=FALSE)
  new_obs  <- synthACS:::sample_micro(test_micro, 500, prob_name= "p")  
  drop_totals <- synthACS:::sample_totals(names(c_list), new_samp[drop_ind,])
  
  t2 <- calculate_TAE(new_samp, c_list,
                      prior_sample_totals= t2[[2]],
                      dropped_obs_totals= drop_totals,
                      new_obs= new_obs)
  
  # hand calc correct outputs
  new_samp2 <- rbind(new_samp[-drop_ind,], new_obs)
  st <- synthACS:::sample_totals(names(c_list), new_samp2)
  
  tae_age <- sum(abs(table(new_samp2$age) - a)) # 3088
  tae_edu <- sum(abs(table(new_samp2$edu_attain) - e)) # 3282
  tae_g   <- sum(abs(table(new_samp2$gender) - g)) # 1100
  
  # text outputs exactly
  expect_equal(t2[[1]], sum(tae_age, tae_edu, tae_g))
  expect_equal(t2[[1]], sum(3088, 3282, 1100))
  expect_equal(st[[1]], t2[[2]][[1]])
  expect_equal(st[[2]], t2[[2]][[2]])
  expect_equal(st[[3]], t2[[2]][[3]])
  
  # test output -- vs non iterating
  t3 <- calculate_TAE(new_samp2, c_list)
  expect_equal(t2,t3)
  
})

test_that("TAE outputs appropriately - iterations 2-3", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  # sample data and run
  set.seed(235L)
  samp <- synthACS:::sample_micro(test_micro, sum(c_list[[1]]), prob_name= "p")
  t1 <- calculate_TAE(samp, c_list)
  
  # take a resample
  drop_ind <- sample(1:nrow(samp), size= 500, replace=FALSE)
  new_obs  <- synthACS:::sample_micro(test_micro, 500, prob_name= "p")  
  drop_totals <- synthACS:::sample_totals(names(c_list), samp[drop_ind,])
  
  t2 <- calculate_TAE(samp, c_list,
                      prior_sample_totals= t1[[2]],
                      dropped_obs_totals= drop_totals,
                      new_obs= new_obs)
  
  # test output -- attributes
  expect_true(is.list(t2))
  expect_true(length(t2) == 2)
  expect_true(is.numeric(t2[[1]]))
  expect_true(all(unlist(lapply(t2[[2]], is.numeric))))
  expect_equal(length(t2[[2]]), length(c_list))
  expect_true(all.equal(sapply(c_list, names), sapply(t2[[2]], names), check.attributes = FALSE))
  
  # take a resample
  drop_ind <- sample(1:nrow(samp), size= 500, replace=FALSE)
  new_obs  <- synthACS:::sample_micro(test_micro, 500, prob_name= "p")  
  drop_totals <- synthACS:::sample_totals(names(c_list), samp[drop_ind,])
  
  t3 <- calculate_TAE(samp, c_list,
                      prior_sample_totals= t1[[2]],
                      dropped_obs_totals= drop_totals,
                      new_obs= new_obs)
  
  # test output -- attributes
  expect_true(is.list(t3))
  expect_true(length(t3) == 2)
  expect_true(is.numeric(t3[[1]]))
  expect_true(all(unlist(lapply(t3[[2]], is.numeric))))
  expect_equal(length(t3[[2]]), length(c_list))
  expect_true(all.equal(sapply(c_list, names), sapply(t3[[2]], names), check.attributes = FALSE))
  
})


#----------------------------------------------------------
context("simulated annealing")
#----------------------------------------------------------

test_that("errors work", {
  # build up some test data:
  diamonds <- data.frame(
    carat= rexp(100),
    cut= factor(sample(c("A", "B", "C"), size= 100, replace= TRUE)),
    x= runif(100, min= 0, max= 10),
    y= runif(100, min= 0, max= 10),
    x= runif(100, min= 0, max= 10)
  )
  
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  
  c_list2 <- c_list; names(c_list2) <- NULL
  
  # expect some errors:
  expect_error(optimize_microdata(diamonds, prob_name= "z"))
  #expect_message(optimize_microdata(test_micro, prob_name= "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= NULL))
  expect_error(optimize_microdata(test_micro, prob_name= "p", 
                 constraint_list= list(letters[1:5], LETTERS[1:5])))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list2))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 tolerance= -1))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 tolerance=  17.5))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 tolerance=  "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 resample_size= -1))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 resample_size= 15.1235))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 resample_size= "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 upscale_100= -1))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 upscale_100= 0.5))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 upscale_100= "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 p_accept= "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 p_accept= 0))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 p_accept= 1.25))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 max_iter= "abc"))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 max_iter= 55.6))
  expect_error(optimize_microdata(test_micro, prob_name= "p", constraint_list= c_list,
                 max_iter= -10))
  
})


test_that("annealing works correctly", {
  # build out constraints
  c_list <- add_constraint(attr_name= "age", attr_totals= a, micro_data= test_micro)
  c_list <- add_constraint(attr_name= "edu_attain", attr_totals= e, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- add_constraint(attr_name= "gender", attr_totals= g, micro_data= test_micro,
                           constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "marital_status", attr_totals= m, micro_data= test_micro,
                                     constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "race", attr_totals= r, micro_data= test_micro,
                                     constraint_list= c_list)
  c_list <- c_list <- add_constraint(attr_name= "nativity", attr_totals= n, micro_data= test_micro,
                                     constraint_list= c_list)
  # sample data and run
  anneal1 <- optimize_microdata(test_micro, "p", c_list, max_iter= 10, resample_size= 500, p_accept= 0.01,
                                verbose= FALSE)
  
  # test structure of output
  expect_true(is.list(anneal1))
  expect_true(is.data.frame(anneal1$best_fit))
  expect_true(is.data.table(anneal1$best_fit))
  expect_true(is.numeric(anneal1$tae))
  expect_true(is.numeric(anneal1$p_accept))
  expect_equal(anneal1$p_accept, 0.01)
  expect_true(is.numeric(anneal1$iter))
  expect_true(is.numeric(anneal1$max_iter))
  expect_lte(anneal1$iter, anneal1$max_iter)
  expect_equal(anneal1$max_iter, 10L)
  
  expect_true(is.matrix(anneal1$tae_path))
  expect_equal(nrow(anneal1$tae_path), anneal1$iter)
  expect_equal(ncol(anneal1$tae_path), 2L)
  expect_equal(anneal1$seed %% 1, 0)
  expect_true(all(anneal1$tae_path[,1] >= anneal1$tae_path[,2]))
  
  expect_true(all(unlist(lapply(anneal1$best_fit, is.factor))))
  expect_true(all(names(anneal1$best_fit) %in% names(test_micro)))
})