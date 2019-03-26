context("loading yaml fragments from files")

require(testthat);


testPath <- getwd();

### For local testing
#require(here);
#testPath <- here::here('tests', 'testthat');

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("a yaml fragment from a file with a single yaml fragment is extracted correctly", {

  res <- extract_yaml_fragments(file.path(testPath,
                                          'intention.dct'));

  testthat::expect_equal(res[[1]][2], "dct:");

});

###-----------------------------------------------------------------------------

test_that("a yaml fragment from a file with a single yaml fragment is loaded correctly", {

  res <- load_yaml_fragments(file.path(testPath,
                                       'intention.dct'));

  testthat::expect_equal(res[[1]]$dct[[1]]$label, "Intention");

});

###-----------------------------------------------------------------------------

test_that("a single yaml fragment that was already extracted from a file is loaded correctly", {

  res <- extract_yaml_fragments(file.path(testPath,
                                          'intention.dct'));
  res <- load_yaml_fragments(yamlFragments=res);

  testthat::expect_equal(res[[1]]$dct[[1]]$label, "Intention");

});

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("yaml fragments from a file with multiple yaml fragments are extracted correctly", {

  res <- extract_yaml_fragments(file.path(testPath,
                                          'attitude.dct'));

  testthat::expect_equal(res[[1]][5], "    label: Attitude");
  testthat::expect_equal(res[[2]][5], "    label: Instrumental Attitude");
  testthat::expect_equal(res[[3]][5], "    label: Experiential Attitude");

});

###-----------------------------------------------------------------------------

test_that("yaml fragments from a file with multiple yaml fragments are loaded correctly", {

  res <- load_yaml_fragments(file.path(testPath,
                                       'attitude.dct'));

  testthat::expect_equal(res[[1]]$dct[[1]]$label, "Attitude");
  testthat::expect_equal(res[[2]]$dct[[1]]$label, "Instrumental Attitude");
  testthat::expect_equal(res[[3]]$dct[[1]]$label, "Experiential Attitude");

});

###-----------------------------------------------------------------------------

test_that("multiple yaml fragments that were already extracted from a file are loaded correctly", {

  res <- extract_yaml_fragments(file.path(testPath,
                                          'attitude.dct'));
  res <- load_yaml_fragments(yamlFragments=res);

  testthat::expect_equal(res[[1]]$dct[[1]]$label, "Attitude");
  testthat::expect_equal(res[[2]]$dct[[1]]$label, "Instrumental Attitude");
  testthat::expect_equal(res[[3]]$dct[[1]]$label, "Experiential Attitude");

});

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("yaml fragments from all files in a directory are extracted correctly", {

  res <- extract_yaml_dir(testPath);

  testthat::expect_equal(basename(names(res)[1]),
                         "attitude.dct");

  testthat::expect_equal(res[[1]][[2]][5], "    label: Instrumental Attitude");
  testthat::expect_equal(res[[2]][[1]][5], "    label: Behavior");

});

###-----------------------------------------------------------------------------

test_that("yaml fragments from all files in a directory are loaded correctly", {

  res <- load_yaml_dir(testPath);

  testthat::expect_equal(basename(names(res)[1]),
                         "attitude.dct");

  testthat::expect_equal(res[[1]][[1]]$dct[[1]]$label, "Attitude");
  testthat::expect_equal(res[[1]][[2]]$dct[[1]]$label, "Instrumental Attitude");
  testthat::expect_equal(res[[1]][[3]]$dct[[1]]$label, "Experiential Attitude");

  testthat::expect_equal(res[[2]][[1]]$dct[[1]]$label, "Behavior");

});

###-----------------------------------------------------------------------------

test_that("yaml fragments that were already extracted from a directory are loaded correctly", {

  res1 <- extract_yaml_dir(testPath,
                           fileRegexes="\\.dct");
  res2 <- load_yaml_fragments(yamlFragments=res1);

  testthat::expect_equal(res2[[1]]$dct[[1]]$label, "Attitude");
  testthat::expect_equal(res2[[2]]$dct[[1]]$label, "Instrumental Attitude");
  testthat::expect_equal(res2[[3]]$dct[[1]]$label, "Experiential Attitude");

  res3 <- load_yaml_list(res1);

  testthat::expect_equal(res3[[1]]$dct[[1]]$label, "Attitude");
  testthat::expect_equal(res3[[2]]$dct[[1]]$label, "Instrumental Attitude");
  testthat::expect_equal(res3[[3]]$dct[[1]]$label, "Experiential Attitude");

});

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("yaml specifications in a single file are constructed into a tree", {

  res1 <- load_yaml_fragments(file.path(testPath,
                                        'second-test-file.rock'),
                              select='codes');
  res2 <- build_tree(res1);

  testthat::expect_equal(res2$EM_SEM_Eco$label,
                         "EM_SEM_Eco");

});

###-----------------------------------------------------------------------------

test_that("a directory of files with yaml fragments is successfully constructed into a tree", {

  res1 <- load_yaml_dir(testPath,
                        fileRegexes="\\.dct");
  res2 <- build_tree(res1);

  testthat::expect_equal(res2$behavior_xl67k7w8j$intention_71vr5q3q$label,
                         "Intention");
  testthat::expect_equal(res2$behavior_xl67k7w8j$intention_71vr5q3q$attitude_71vqm37n$attitude_experiential_xl678lqgn$label,
                         "Experiential Attitude");

});

###-----------------------------------------------------------------------------

test_that("a list of loaded yaml fragments are successfully constructed into a tree", {

  res1 <- extract_yaml_dir(testPath,
                           fileRegexes="\\.dct");
  res2 <- load_yaml_list(res1);
  res3 <- build_tree(res2);

  testthat::expect_equal(res3$behavior_xl67k7w8j$intention_71vr5q3q$label,
                         "Intention");
  testthat::expect_equal(res3$behavior_xl67k7w8j$intention_71vr5q3q$attitude_71vqm37n$attitude_experiential_xl678lqgn$label,
                         "Experiential Attitude");

})

###-----------------------------------------------------------------------------

test_that("a tree specified in one fragment is loaded and parsed properly", {

  res1 <- load_yaml_fragments(file.path(testPath,
                                        'hierarchy.dct'));
  res2 <- build_tree(res1);

  testthat::expect_equal(res2$parent1$child2$grandchild5$label,
                         "grandchild5");

});
