
context("Testing bin.oth() function")

test_that("random test", {
  expect_equal(1, 1)
})


test_that("Test if bin.oth() returns same result as if running tree.bins() with the same df", {

  test.df <- AmesImpFctrs %>% select(Sale.Condition, Neighborhood, SalePrice)

  list.lkup <- tree.bins(test.df, SalePrice, return = "lkup.list")

  pass.through.df <- AmesImpFctrs %>% select(Sale.Condition, Neighborhood, SalePrice)

  fnc <- bin.oth(list.lkup, pass.through.df)

  expect_equal(fnc, tree.bins(pass.through.df, SalePrice))

})

test_that("Test to see if lookup tables and joins are performed correctly", {

  #Using the function
  test.df <- AmesImpFctrs %>% select(Sale.Condition, Neighborhood, SalePrice)

  list.lkup <- tree.bins(test.df, SalePrice, return = "lkup.list")

  fnc <- bin.oth(list.lkup, test.df)

  #Creating it from scratch
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

  expect_identical(fnc, test.df.final.Nei, "Testing that the df is the same")

})

