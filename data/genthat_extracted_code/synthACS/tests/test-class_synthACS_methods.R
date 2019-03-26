
library(testthat)
library(synthACS)

#----------------------------------------------------------
context("synthACS methods")
#----------------------------------------------------------

test_that("gender constraint creates successfully", {
  # run function
  g <- all_geog_constraint_gender(syn, method= "macro.table")
  g2 <- all_geog_constraint_gender(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(c("Male", "Female"), 4)))
  expect_equal(g[[1]], syn[[1]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g[[2]], syn[[2]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g[[3]], syn[[3]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g[[4]], syn[[4]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(c("Male", "Female"), 4)))
  expect_equal(g2[[1]], syn[[1]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g2[[2]], syn[[2]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g2[[3]], syn[[3]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  expect_equal(g2[[4]], syn[[4]]$macro_constraints$age_by_sex[2:3], check.attributes= FALSE)
  
})


test_that("age constraint creates successfully", {
  # run function
  g <- all_geog_constraint_age(syn, method= "macro.table")
  g2 <- all_geog_constraint_age(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$age), 4)))
  expect_equal(g[[1]], syn[[1]]$macro_constraints$age_by_sex[4:19] + syn[[1]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g[[2]], syn[[2]]$macro_constraints$age_by_sex[4:19] + syn[[2]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g[[3]], syn[[3]]$macro_constraints$age_by_sex[4:19] + syn[[3]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g[[4]], syn[[4]]$macro_constraints$age_by_sex[4:19] + syn[[4]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$age), 4)))
  expect_equal(g2[[1]], syn[[1]]$macro_constraints$age_by_sex[4:19] + syn[[1]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g2[[2]], syn[[2]]$macro_constraints$age_by_sex[4:19] + syn[[2]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g2[[3]], syn[[3]]$macro_constraints$age_by_sex[4:19] + syn[[3]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  expect_equal(g2[[4]], syn[[4]]$macro_constraints$age_by_sex[4:19] + syn[[4]]$macro_constraints$age_by_sex[20:35], check.attributes= FALSE)
  
})

test_that("marital status constraint creates successfully", {
  # run function
  g <- all_geog_constraint_marital_status(syn, method= "macro.table")
  g2 <- all_geog_constraint_marital_status(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$marital_status), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$marital_status), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})


test_that("employment status constraint creates successfully", {
  # run function
  g <- all_geog_constraint_employment(syn, method= "macro.table")
  g2 <- all_geog_constraint_employment(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$emp_status), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$emp_status), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})

test_that("nativity status constraint creates successfully", {
  # run function
  g <- all_geog_constraint_nativity(syn, method= "macro.table")
  g2 <- all_geog_constraint_nativity(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$nativity), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$nativity), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})

test_that("poverty status constraint creates successfully", {
  # run function
  g <- all_geog_constraint_poverty(syn, method= "macro.table")
  g2 <- all_geog_constraint_poverty(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$poverty), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$poverty), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})

test_that("geographic mobility constraint creates successfully", {
  # run function
  g <- all_geog_constraint_geog_mob(syn, method= "macro.table")
  g2 <- all_geog_constraint_geog_mob(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$geog_mobility), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$geog_mobility), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})

test_that("individual income constraint creates successfully", {
  # run function
  g <- all_geog_constraint_income(syn, method= "macro.table")
  g2 <- all_geog_constraint_income(syn, method= "synthetic")
  
  # test outputs
  expect_equal(class(g), "list")
  expect_equal(length(g), length(syn))
  expect_equal(names(g), names(syn))
  expect_true(all(unlist(lapply(g, names)) == rep(levels(syn[[1]][[2]]$ind_income), 4)))
  expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) == rep(levels(syn[[1]][[2]]$ind_income), 4)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})

test_that("race constraint creates successfully", {
  # run function
  #g <- all_geog_constraint_race(syn, method= "macro.table")
  g2 <- all_geog_constraint_race(syn, method= "synthetic")
  
  # test outputs
  # expect_equal(class(g), "list")
  # expect_equal(length(g), length(syn))
  # expect_equal(names(g), names(syn))
  # expect_true(all(unlist(lapply(g, names)) %in% levels(syn[[2]][[2]]$race)))
  # expect_equal(sum(g[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  # expect_equal(sum(g[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  # expect_equal(sum(g[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  # expect_equal(sum(g[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
  expect_equal(class(g2), "list")
  expect_equal(length(g2), length(syn))
  expect_equal(names(g2), names(syn))
  expect_true(all(unlist(lapply(g2, names)) %in% levels(syn[[2]][[2]]$race)))
  expect_equal(sum(g2[[1]]), syn[[1]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[2]]), syn[[2]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[3]]), syn[[3]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  expect_equal(sum(g2[[4]]), syn[[4]]$macro_constraints$age_by_sex[1], check.attributes = FALSE)
  
})


test_that("marginalize_attr correctly", {
  set.seed(567L)
  df <- data.frame(gender= factor(sample(c("male", "female"), size= 100, replace=T)),
                   age= factor(sample(1:5, size= 100, replace=T)),
                   pov= factor(sample(c("below poverty", "at above poverty"),
                                     size= 100, replace=T, prob= c(.15,.85))),
                   p= runif(100))
  df$p <- df$p / sum(df$p)
  class(df) <- c("data.frame", "micro_synthetic")

  # micro-synthetic
  df2 <- marginalize_attr(df, varlist= "gender")
  df3 <- marginalize_attr(df, varlist= c("gender", "age"))
  df4 <- marginalize_attr(df, varlist= c("gender", "age"), marginalize_out= TRUE)
  
  ## test:
  expect_equal(sum(df2[,p]), 1)
  expect_equal(sum(df3[,p]), 1)
  expect_equal(sum(df4[,p]), 1)
  expect_equal(nrow(df2), length(levels(df$gender)))
  expect_equal(nrow(df3), length(levels(df$gender)) * length(levels(df$age)))
  expect_equal(nrow(df4), length(levels(df$pov)))
  expect_equal(df2[,p], as.vector(tapply(df$p, df$gender, sum)))
  expect_equal(df4[,p], as.vector(tapply(df$p, list(df$pov), sum)))
  
  # synthACS
  df_list <- replicate(10, df, simplify= FALSE)
  dummy_list <- replicate(10, list(letters[1:3]), simplify= FALSE)
  df_list <- mapply(function(a,b) {return(list(a, b))}, a= dummy_list, b= df_list, SIMPLIFY = FALSE)
  class(df_list) <- c("list", "synthACS")
  df_list2 <- marginalize_attr(df_list, varlist= c("gender", "age"))
  
  ## test:
  expect_true(all( unlist(lapply(df_list2, function(l) sum(l[[2]]$p))) == 1))
  expect_equal(unlist(lapply(df_list, function(l) { length(levels(l[[2]]$gender)) * length(levels(l[[2]]$age)) })),
               unlist(lapply(df_list2, function(l) { nrow(l[[2]]) })))
  expect_equal(class(df_list2), c("list", "synthACS"))
  
})