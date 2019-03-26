context("loading different types of yaml fragments")

require(testthat);

testPath <- getwd();

### For local testing
#require(here);
#testPath <- here::here('tests', 'testthat');

###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------
###-----------------------------------------------------------------------------

test_that("a yaml fragment ", {

  res1 <- load_yaml_fragments("
---
justification:
  id: blabla
  label: bla die bla
  description: bla die bla die bla bla bla
  source:
    id: source_id_2
    label: some source label for this source
---
");

  res1_simplified <-
    simplify_by_flattening(res1);

  testthat::expect_equal(res1_simplified$justification$id,
                         "blabla");

});

###-----------------------------------------------------------------------------

test_that("a yaml fragment ", {

  res2 <- load_yaml_fragments("
---
justification:
  id: just_id
  label: bla die bla
  description: bla die bla die bla bla bla
source:
  id: source_id
---
regular non-YAML stuff
---
decision:
  justification:
    id: just_id2
    source:
      id: source_id_2
      label: some source label for this source
---
");

  res2_simplified <-
    simplify_by_flattening(res2);

  testthat::expect_equal(res2_simplified$decision$justification$source$id,
                         "source_id_2");

});

###-----------------------------------------------------------------------------

test_that("a yaml fragment ", {

  res3 <- load_yaml_fragments("
---
justification:
  id: just_id
  label: bla die bla
  description: bla die bla die bla bla bla
source:
  id: source_id
---
regular non-YAML stuff
---
decision:
  -
    id: decision_id_1
    justification:
      id: just_id2
      source:
        id: source_id_2
        label: some source label for this source
  -
    id: decision_id_2
    justification:
      id: just_id3
      source:
        id: source_id_4
        label: some source label for this other source

---
");

  res3_simplified <-
    simplify_by_flattening(res3);

  testthat::expect_equal(res3_simplified[[3]]$justification$source$id,
                         "source_id_2");

});

###-----------------------------------------------------------------------------

test_that("loads of yaml fragments in files in a directory are loaded and simplified", {

  res4 <- load_and_simplify_dir(testPath);

  testthat::expect_equal(names(res4)[5], "justifier");

});

###-----------------------------------------------------------------------------

test_that("a selection is made in loads of yaml fragments in loads of files in a directory that are simplified", {

  res5 <- load_and_simplify_dir(testPath,
                                select='dct');

  testthat::expect_equal(unique(names(res5)), "dct");

});

###-----------------------------------------------------------------------------

test_that("first extracting, and then loading and simplifying yaml fragments works", {

  res6 <- extract_yaml_fragments(file.path(testPath,
                                           'second-test-file.rock'));

  res6_simplified <- load_and_simplify(yamlFragments=res6,
                                       select='metadata');

  testthat::expect_equal(res6_simplified$metadata$caseId, 2);

});

###-----------------------------------------------------------------------------

test_that("building a tree from yaml fragments that were first extracted, and then loaded and simplified", {

  res7 <- extract_yaml_fragments(file.path(testPath,
                                           'hierarchy.dct'));

  res7_simplified <- load_and_simplify(yamlFragments=res7,
                                       select='dct');

  res7_tree <- build_tree(res7_simplified);

  testthat::expect_equal(res7_tree$parent2$child3$name, "child3");

});

###-----------------------------------------------------------------------------
