
context("Testing tree.bins() function")

########################################
############# 1 predictors #############
############# & no leaves  #############
########################################

### Testing results for expected errors with:
### 1 predictor & levels 1:3 & no leaves =>  Levels > 3 will react as 3


test_that("Testing for 1 predictor df with no leaves and 1 levels", {

  test.df <- AmesSubset %>%
    select(Street, SalePrice) %>%
    mutate(Street = "Grvl" %>% as.factor())

  expect_error(tree.bins(test.df, SalePrice, return = "new.fctrs"), "object 'new.fctrs' not found")

})

test_that("Testing for 1 predictor df with no leaves and 2 levels", {

  test.df <- AmesSubset %>% select(Street, SalePrice)

  expect_error(tree.bins(test.df, SalePrice, return = "new.fctrs"), "object 'new.fctrs' not found")

})

test_that("Testing for 1 predictor df with no leaves and 3 levels", {

  test.df <- AmesSubset %>%
    select(Street, SalePrice) %>%
    mutate(Street = rep_len(c("Grvl", "Pave", "Road"), length.out = dim(AmesSubset)[1]) %>% as.factor())

  # tree = rpart(formula = SalePrice ~ Street, data = test.df)
  # tree.rules = unlist(rpart.lists(tree))

  expect_error(tree.bins(test.df, SalePrice, return = "new.fctrs"), "object 'new.fctrs' not found")

})

#######################################
############# 1 predictor #############
############# & 2 levels  #############
############# & 2 leaves  #############
#######################################

### Testing result for working data.frame passed in with:
### 1 predictor & levels = 2 & 1L and 1R split
### If it has no leaves or only 2 leaves, then it will not readjust it

test_that("Testing for 1 predictor df & 2 levels & 2 leaves", {

  test.df <- AmesSubset %>%
    select(Street, SalePrice)

  # tree = rpart(formula = SalePrice ~ Street, cp = .001, data = test.df)
  # rpart.plot(tree)

  expect_error(tree.bins(test.df, SalePrice, control = rpart.control(cp = .001), return = "new.fctrs"),
               "object 'new.fctrs' not found")
})

#######################################
############# 1 predictor #############
############# & 3 levels  #############
############# & 2 leaves  #############
#######################################

### Testing result for working data.frame passed in with:
### 1 predictor & levels = 3 & 1L and 1R leaves
### levels > 3  will react the same

test_that("Testing for 1 predictor df, for 1L and 1R split & 3 levels", {

  test.df <- AmesSubset %>%
    select(Land.Slope, SalePrice)

  # tree = rpart(formula = SalePrice ~ Land.Slope  , cp = .001, data = test.df)
  # rpart.plot(tree)

  fnc = tree.bins(test.df, SalePrice, control = rpart.control(cp = .001), return = "lkup.list")
  fnc2 = data.frame(Categories = unique(fnc[[1]]$Categories))

  expect_identical(fnc2, data.frame(Categories = c("Group.1", "Group.2")))
})

#######################################
############# 2 predictors ############
#######################################

#Testing for two of the predictors. The others will react similarly

test_that("Testing for 2 predictors,
          one will provide a null list and the other will recategorize the variable.", {

  test.df <- AmesSubset %>% select(Street, Neighborhood, SalePrice)
  # tree <- rpart(formula = SalePrice ~ Street, data = test.df)
  # plot <- rpart.plot(tree)
  test.list <- list(NULL,
                    data.frame(Neighborhood = c("BrDale", "BrkSide", "IDOTRR", "MeadowV", "OldTown",
                                                "Somerst", "Timber", "Veenker", "Blmngtn", "ClearCr",
                                                "CollgCr", "Crawfor", "Gilbert", "Greens", "NWAmes",
                                                "SawyerW", "Blueste", "Edwards", "Landmrk",  "Mitchel",
                                                "NAmes", "NPkVill",  "Sawyer", "SWISU", "GrnHill",
                                                "NoRidge", "NridgHt", "StoneBr"),
                               Categories = c("Group.1", "Group.1", "Group.1", "Group.1", "Group.1",
                                              "Group.2", "Group.2", "Group.2", "Group.3", "Group.3",
                                              "Group.3", "Group.3", "Group.3", "Group.3", "Group.3",
                                              "Group.3", "Group.4", "Group.4", "Group.4", "Group.4",
                                              "Group.4", "Group.4", "Group.4", "Group.4", "Group.5",
                                              "Group.5", "Group.5", "Group.5"), stringsAsFactors = FALSE))

  test.df.adj <- test.df %>%
    left_join(test.list[[2]], by = "Neighborhood")

  test.df.final <- test.df.adj[, !(names(test.df.adj) %in% "Neighborhood")] %>%
    as.data.table() %>%
    setnames("Categories", "Neighborhood")

  fnc <- tree.bins(test.df, y = SalePrice, return = "lkup.list")

  fnc2 <- tree.bins(test.df, y = SalePrice, return = "new.fctrs")

  expect_identical(fnc, test.list, "Testing that lookup list with null is the same")
  expect_identical(fnc2, test.df.final, "Testing that the df is the same")
})


test_that("Testing for 2 predictors,
          both will recategorize the variable.
          Recategorized variable will contain multiple leaves.", {

  test.df <- AmesSubset %>% select(Sale.Condition, Neighborhood, SalePrice)
  # tree <- rpart(formula = SalePrice ~ Street, data = test.df)
  # plot <- rpart.plot(tree)
  test.list <- list(

    data.frame(Sale.Condition = c("Abnorml","AdjLand", "Family",
                                       "Partial", "Alloca", "Normal") ,
                      Categories = c("Group.1", "Group.1", "Group.1",
                                     "Group.2", "Group.3", "Group.3"), stringsAsFactors = FALSE),

    data.frame(Neighborhood = c("BrDale", "BrkSide", "IDOTRR", "MeadowV", "OldTown",
                                       "Somerst", "Timber", "Veenker", "Blmngtn", "ClearCr",
                                       "CollgCr", "Crawfor", "Gilbert", "Greens", "NWAmes",
                                       "SawyerW", "Blueste", "Edwards", "Landmrk",  "Mitchel",
                                       "NAmes", "NPkVill",  "Sawyer", "SWISU", "GrnHill",
                                       "NoRidge", "NridgHt", "StoneBr"),
                      Categories = c("Group.1", "Group.1", "Group.1", "Group.1", "Group.1",
                                     "Group.2", "Group.2", "Group.2", "Group.3", "Group.3",
                                     "Group.3", "Group.3", "Group.3", "Group.3", "Group.3",
                                     "Group.3", "Group.4", "Group.4", "Group.4", "Group.4",
                                     "Group.4", "Group.4", "Group.4", "Group.4", "Group.5",
                                     "Group.5", "Group.5", "Group.5"), stringsAsFactors = FALSE))

  test.df.adj.SC <- test.df %>%
    left_join(test.list[[1]], by = "Sale.Condition")

  test.df.final.SC <- test.df.adj.SC[, !(names(test.df.adj.SC) %in% "Sale.Condition")] %>%
    as.data.table() %>%
    setnames("Categories", "Sale.Condition")

  test.df.adj.Nei <- test.df.final.SC %>%
    left_join(test.list[[2]], by = "Neighborhood")

  test.df.final.Nei <- test.df.adj.Nei[, !(names(test.df.adj.Nei) %in% "Neighborhood")] %>%
    as.data.table() %>%
    setnames("Categories", "Neighborhood")



  fnc <- tree.bins(test.df, y = SalePrice, return = "lkup.list")

  fnc2 <- tree.bins(test.df, y = SalePrice, return = "new.fctrs")

  expect_identical(fnc, test.list, "Testing that lookup list without null is the same")
  expect_identical(fnc2, test.df.final.Nei, "Testing that the df is the same")
})


test_that("Check for correct classes and that order does not affect y (SalePrice here)", {

  test.df <- AmesSubset %>%
    select(Total.Bsmt.SF, Lot.Area, SalePrice, Neighborhood)

  test.df.adj <- test.df %>%
    mutate(Neighborhood = as.character(Neighborhood))

  test.df.class <- data.frame(Class = c(class(test.df.adj[[1]]), class(test.df.adj[[2]]),
                                        class(test.df.adj[[3]]),class(test.df.adj[[4]])))

  fnc <- tree.bins(test.df, y = SalePrice, return = "new.fctrs")

  fnc.class <- data.frame(Class = c(class(fnc[[1]]), class(fnc[[2]]),
                                        class(fnc[[3]]), class(fnc[[4]])))

  expect_identical(fnc.class, test.df.class, "Testing that the df is the same")
})

####################################################################
############# Manually Assign Specified cp Per Variable ############
####################################################################

test_that("Check for correct classes and that order does not affect y (SalePrice here)", {

  test.df <- AmesSubset %>%
    select(MS.Zoning, SalePrice, Neighborhood)

  cp.df <- data.frame(Variables = c("Neighborhood", "MS.Zoning"), CP = c(.001, .2))

  fnc <- tree.bins(test.df, y = SalePrice, control = cp.df, return = "lkup.list")

  cp.neighborhood = rpart(SalePrice ~ Neighborhood, data =test.df, cp = .001)
  #rpart.plot(cp.neighborhood)

  cp.mszoning = rpart(SalePrice ~ MS.Zoning, data =test.df, cp = .2)
  #rpart.plot(cp.mszoning)

  test.list <- list(
    NULL,
    data.frame(Neighborhood = c("BrDale", "IDOTRR", "MeadowV", "Blueste", "Edwards",
                                "Landmrk", "Sawyer", "SWISU", "Blmngtn", "Gilbert",
                                "NWAmes", "SawyerW", "Somerst", "BrkSide", "OldTown",
                                "Mitchel", "NAmes", "NPkVill", "ClearCr", "CollgCr",
                                "Crawfor", "Greens", "GrnHill", "NoRidge", "NridgHt",
                                "StoneBr", "Timber", "Veenker"),
               Categories = c("Group.1", "Group.1", "Group.1", "Group.2", "Group.2",
                              "Group.2", "Group.2", "Group.2", "Group.3", "Group.3",
                              "Group.3", "Group.3", "Group.4", "Group.5", "Group.5",
                              "Group.6", "Group.7", "Group.7", "Group.8", "Group.8",
                              "Group.8", "Group.8", "Group.9", "Group.9", "Group.9",
                              "Group.9", "Group.10", "Group.10"), stringsAsFactors = FALSE))



  expect_identical(fnc, test.list, "Testing that the df is the same")
})

