context("simplification")

require(testthat);

testPath <- getwd();

### For local testing
#require(here);
#testPath <- here::here('tests', 'testthat');

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("a yaml fragment can be simplified selectively", {

  res1 <- load_yaml_fragments(file.path(testPath,
                                        'xtc-non-users.jmd'));
  res2 <- simplify_by_flattening(res1,
                                 simplify="assertion");

  testthat::expect_equal(length(res2$source), 2);

});

###-----------------------------------------------------------------------------

test_that("a yaml fragment can be simplified completely", {

  res1 <- load_yaml_fragments(file.path(testPath,
                                        'xtc-non-users.jmd'));
  res2 <- simplify_by_flattening(res1);

  testthat::expect_equal(length(res2), 5);

});

###-----------------------------------------------------------------------------

