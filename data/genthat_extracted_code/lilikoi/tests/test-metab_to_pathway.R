context("test-metab_to_pathway.R")

test_that("Matching works", {
  names = c("Asparagine", "Hypotaurine", "5-Oxoproline", "Cysteine", "Aspartate")
  result = lilikoi.metab_to_pathway(names, "name")
  matched = sum(result$FoundMatch == 1)
  expect_equal(matched, 5)

  # Test a miss
  names = c("Asparagine", "foobar", "111", "dsdas")
  result = lilikoi.metab_to_pathway(names, "name")
  matched = sum(result$FoundMatch == 1)
  expect_equal(matched, 1)

  # Test search by KEGG
  names = c("C00152", "C00519", "C01879", "C00097", "C00049")
  result = lilikoi.metab_to_pathway(names, "kegg")
  matched = sum(result$FoundMatch == 1)
  expect_equal(matched, 5)

  # Test miss by KEGG
  names = c("C00152", "FOOBAR", "C01879", "C00097", "C00049")
  result = lilikoi.metab_to_pathway(names, "kegg")
  matched = sum(result$FoundMatch == 1)
  expect_equal(matched, 4)

  # Test miss by KEGG
  names = c("HMDB0000191")
  result = lilikoi.metab_to_pathway(names, "hmdb")
  matched = sum(result$FoundMatch == 1)
  # expect_equal(matched, 4)
})


