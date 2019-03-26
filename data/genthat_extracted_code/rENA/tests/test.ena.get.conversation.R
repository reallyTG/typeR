suppressMessages(library(rENA, quietly = T, verbose = F))
context("Test getting conversations");

# df.file <- system.file("extdata", "rs.data.csv", package="rENA")
test_that("Getting convserations from data.frame", {
  # df.dt = data.table::data.table(RS.data); #data.table::data.table(read.csv(df.file));
  # conversations = c("ActivityNumber", "GroupName") #,"Condition");
  # convs = ena.get.conversation(df.file, conversations)
  #
  # conversations2 = c("ActivityNumber", "GroupName", "Condition");
  # convs2 = ena.get.conversation(df.file, conversations2)
  #
  # testthat::expect_equal(length(names(convs)), 18);
  # testthat::expect_true(all(names(convs[[" 2"]]) %in% c("PAM","Pneumatic","Series Elastic","Hydraulic","Electric")));
  #
  # testthat::expect_equal(names(convs2$` 2`$`PAM`), c("FirstGame","SecondGame"))
})
