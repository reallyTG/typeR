library(beautier)


### Name: create_beast2_input_tracelog
### Title: Creates the 'tracelog' section of the 'logger' section of a
###   BEAST2 XML parameter file
### Aliases: create_beast2_input_tracelog

### ** Examples

  created <- beautier:::create_beast2_input_tracelog(ids = 1)
  expected <- c(
    paste0(
      "<logger id=\"tracelog\" fileName=\"1.log\" ",
      "logEvery=\"1000\" model=\"@posterior\" sanitiseHeaders=\"true\" ",
      "sort=\"smart\">"
    ),
    "    <log idref=\"posterior\"/>",
    "    <log idref=\"likelihood\"/>",
    "    <log idref=\"prior\"/>",
    "    <log idref=\"treeLikelihood.1\"/>",
    paste0(
      "    <log id=\"TreeHeight.t:1\" ",
      "spec=\"beast.evolution.tree.TreeHeightLogger\" ",
      "tree=\"@Tree.t:1\"/>"
    ),
    "    <log idref=\"YuleModel.t:1\"/>",
    "    <log idref=\"birthRate.t:1\"/>",
    "</logger>"
   )
   testthat::expect_equal(created, expected)



