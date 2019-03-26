
library(testthat)
library(synthACS)

#----------------------------------------------------------
context("macroACS methods")
#----------------------------------------------------------

test_that("fetch - age_by_sex - estimates work", {
  # run function on all types of use cases
  options(warn=-1)
  age_sex_vector_all <- fetch_data(ca_dat, geography= "*", dataset= "estimate",
                                   choice= "age_by_sex")
  age_sex_vector_some <- fetch_data(ca_dat, geography= c("Alameda", "Amador", "Los Angeles"), 
                                   dataset= "estimate", choice= "age_by_sex")
  age_sex_vector_one <- fetch_data(ca_dat, geography= "San Bernardino", dataset= "estimate", 
                                   choice= "age_by_sex")
  options(warn=0)
  
  # test outputs
  expect_true(exists("age_sex_vector_all"))
  expect_true(exists("age_sex_vector_some"))
  expect_true(exists("age_sex_vector_one"))
  expect_true(is.data.frame(age_sex_vector_all))
  expect_true(is.data.frame(age_sex_vector_some))
  expect_true(is.data.frame(age_sex_vector_one))
  
  expect_equal(nrow(age_sex_vector_all), nrow(ca_dat$geography))
  expect_equal(names(age_sex_vector_all), names(ca_dat$estimates$age_by_sex))
  expect_equal(rownames(age_sex_vector_all), ca_dat$geography$NAME)
  expect_equal(age_sex_vector_all, ca_dat$estimates$age_by_sex)
  
  expect_equal(nrow(age_sex_vector_some), 3L)
  expect_equal(names(age_sex_vector_some), names(ca_dat$estimates$age_by_sex))
  expect_equal(rownames(age_sex_vector_some), 
               c("Alameda County, California", "Amador County, California", "Los Angeles County, California"))
  expect_equal(age_sex_vector_some, ca_dat$estimates$age_by_sex[c(1,3,19),])
  
  expect_equal(nrow(age_sex_vector_one), 1L)
  expect_equal(names(age_sex_vector_one), names(ca_dat$estimates$age_by_sex))
  expect_equal(rownames(age_sex_vector_one), "San Bernardino County, California")
  expect_equal(age_sex_vector_one, ca_dat$estimates$age_by_sex[36,])
  
})

test_that("fetch - age_by_sex - SE work", {
  # run function on all types of use cases
  options(warn=-1)
  age_sex_vector_all <- fetch_data(ca_dat, geography= "*", dataset= "st.err",
                                   choice= "age_by_sex")
  age_sex_vector_some <- fetch_data(ca_dat, geography= c("Alameda", "Amador", "Los Angeles"), 
                                    dataset= "st.err", choice= "age_by_sex")
  age_sex_vector_one <- fetch_data(ca_dat, geography= "San Bernardino", dataset= "st.err", 
                                   choice= "age_by_sex")
  options(warn=0)
  
  # test outputs
  expect_true(exists("age_sex_vector_all"))
  expect_true(exists("age_sex_vector_some"))
  expect_true(exists("age_sex_vector_one"))
  expect_true(is.data.frame(age_sex_vector_all))
  expect_true(is.data.frame(age_sex_vector_some))
  expect_true(is.data.frame(age_sex_vector_one))
  
  expect_equal(nrow(age_sex_vector_all), nrow(ca_dat$geography))
  expect_equal(names(age_sex_vector_all), names(ca_dat$standard_error$age_by_sex))
  expect_equal(rownames(age_sex_vector_all), ca_dat$geography$NAME)
  expect_equal(age_sex_vector_all, ca_dat$standard_error$age_by_sex)
  
  expect_equal(nrow(age_sex_vector_some), 3L)
  expect_equal(names(age_sex_vector_some), names(ca_dat$standard_error$age_by_sex))
  expect_equal(rownames(age_sex_vector_some), 
               c("Alameda County, California", "Amador County, California", "Los Angeles County, California"))
  expect_equal(age_sex_vector_some, ca_dat$standard_error$age_by_sex[c(1,3,19),])
  
  expect_equal(nrow(age_sex_vector_one), 1L)
  expect_equal(names(age_sex_vector_one), names(ca_dat$standard_error$age_by_sex))
  expect_equal(rownames(age_sex_vector_one), "San Bernardino County, California")
  expect_equal(age_sex_vector_one, ca_dat$standard_error$age_by_sex[36,])
})

#----------------------------
test_that("fetch - pop_by_race - estimates work", {
  # run function on all types of use cases
  options(warn=-1)
  vector_all <- fetch_data(ca_dat, geography= "*", dataset= "estimate",
                           choice= "pop_by_race")
  vector_some <- fetch_data(ca_dat, geography= c("Alameda", "Amador", "Los Angeles"), 
                           dataset= "estimate", choice= "pop_by_race")
  vector_one <- fetch_data(ca_dat, geography= "San Bernardino", dataset= "estimate", 
                           choice= "pop_by_race")
  options(warn=0)
  
  # test outputs
  expect_true(exists("vector_all"))
  expect_true(exists("vector_some"))
  expect_true(exists("vector_one"))
  expect_true(is.data.frame(vector_all))
  expect_true(is.data.frame(vector_some))
  expect_true(is.data.frame(vector_one))
  
  expect_equal(nrow(vector_all), nrow(ca_dat$geography))
  expect_equal(names(vector_all), names(ca_dat$estimates$pop_by_race))
  expect_equal(rownames(vector_all), ca_dat$geography$NAME)
  expect_equal(vector_all, ca_dat$estimates$pop_by_race)
  
  expect_equal(nrow(vector_some), 3L)
  expect_equal(names(vector_some), names(ca_dat$estimates$pop_by_race))
  expect_equal(rownames(vector_some), 
               c("Alameda County, California", "Amador County, California", "Los Angeles County, California"))
  expect_equal(vector_some, ca_dat$estimates$pop_by_race[c(1,3,19),])
  
  expect_equal(nrow(vector_one), 1L)
  expect_equal(names(vector_one), names(ca_dat$estimates$pop_by_race))
  expect_equal(rownames(vector_one), "San Bernardino County, California")
  expect_equal(vector_one, ca_dat$estimates$pop_by_race[36,])
  
})

test_that("fetch - pop_by_race - SE work", {
  # run function on all types of use cases
  options(warn=-1)
  vector_all <- fetch_data(ca_dat, geography= "*", dataset= "st.err",
                           choice= "pop_by_race")
  vector_some <- fetch_data(ca_dat, geography= c("Alameda", "Amador", "Los Angeles"), 
                            dataset= "st.err", choice= "pop_by_race")
  vector_one <- fetch_data(ca_dat, geography= "San Bernardino", dataset= "st.err", 
                           choice= "pop_by_race")
  options(warn=0)
  
  # test outputs
  expect_true(exists("vector_all"))
  expect_true(exists("vector_some"))
  expect_true(exists("vector_one"))
  expect_true(is.data.frame(vector_all))
  expect_true(is.data.frame(vector_some))
  expect_true(is.data.frame(vector_one))
  
  expect_equal(nrow(vector_all), nrow(ca_dat$geography))
  expect_equal(names(vector_all), names(ca_dat$standard_error$pop_by_race))
  expect_equal(rownames(vector_all), ca_dat$geography$NAME)
  expect_equal(vector_all, ca_dat$standard_error$pop_by_race)
  
  expect_equal(nrow(vector_some), 3L)
  expect_equal(names(vector_some), names(ca_dat$standard_error$pop_by_race))
  expect_equal(rownames(vector_some), 
               c("Alameda County, California", "Amador County, California", "Los Angeles County, California"))
  expect_equal(vector_some, ca_dat$standard_error$pop_by_race[c(1,3,19),])
  
  expect_equal(nrow(vector_one), 1L)
  expect_equal(names(vector_one), names(ca_dat$standard_error$pop_by_race))
  expect_equal(rownames(vector_one), "San Bernardino County, California")
  expect_equal(vector_one, ca_dat$standard_error$pop_by_race[36,])
  
})


#----------------------------
test_that("span, endyear, geography, dataset names", {
  sp <- get_span(ca_dat)
  expect_equal(sp, ca_dat$span)
  
  end <- get_endyear(ca_dat)
  expect_equal(end, ca_dat$endyear)
  
  g <- get_geography(ca_dat)
  expect_equal(g, ca_dat$geo_title)
  
  nn <- get_dataset_names(ca_dat)
  expect_equal(nn, names(ca_dat$estimates))
  expect_equal(nn, names(ca_dat$standard_error))
})



#----------------------------
test_that("split macroACS works", {
  # run function
  ca_split <- split(ca_dat, n_splits= 7)
  # comparison / manual
  split_idx <- parallel::splitIndices(nrow(ca_dat$geography), 7)
  
  # test structure
  expect_equal(unlist(lapply(ca_split, class)), rep("macroACS", 7))
  expect_equal(unlist(lapply(ca_split, names)), rep(names(ca_dat), 7))
  expect_equal(unlist(lapply(ca_split, get_span)), rep(get_span(ca_dat), 7))
  expect_equal(unlist(lapply(ca_split, get_endyear)), rep(get_endyear(ca_dat), 7))
  expect_equal(unlist(lapply(ca_split, function(l) return(l$geo_title))), rep(NULL, 7))
  
  # test correct number of rows per split
  expect_equal(nrow(ca_split[[1]]$estimates[[1]]), length(split_idx[[1]]))
  expect_equal(nrow(ca_split[[2]]$estimates[[7]]), length(split_idx[[2]]))
  expect_equal(nrow(ca_split[[3]]$estimates[[8]]), length(split_idx[[3]]))
  expect_equal(nrow(ca_split[[4]]$estimates[[5]]), length(split_idx[[4]]))
  expect_equal(nrow(ca_split[[5]]$standard_error[[2]]), length(split_idx[[5]]))
  expect_equal(nrow(ca_split[[6]]$standard_error[[6]]), length(split_idx[[6]]))
  expect_equal(nrow(ca_split[[7]]$standard_error[[10]]), length(split_idx[[7]]))
  
  # accurate geography splits
  expect_equal(ca_split[[1]]$geography, ca_dat$geography[ split_idx[[1]], ])
  expect_equal(ca_split[[4]]$geography, ca_dat$geography[ split_idx[[4]], ])
  expect_equal(ca_split[[7]]$geography, ca_dat$geography[ split_idx[[7]], ])
  
  # accurate estimates splites
  expect_equal(ca_split[[2]]$estimates, lapply(ca_dat$estimates, function(l, idx) return(l[idx, ]), idx= split_idx[[2]]))
  expect_equal(ca_split[[3]]$estimates, lapply(ca_dat$estimates, function(l, idx) return(l[idx, ]), idx= split_idx[[3]]))
  expect_equal(ca_split[[5]]$estimates, lapply(ca_dat$estimates, function(l, idx) return(l[idx, ]), idx= split_idx[[5]]))
  
  # accurate SE splits
  expect_equal(ca_split[[6]]$standard_error, 
               lapply(ca_dat$standard_error, function(l, idx) return(l[idx, ]), idx= split_idx[[6]]))
})