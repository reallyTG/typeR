library(testthat)
library(namedCapture)
context("name value")

for(engine in c("PCRE", "RE2")){
  namedCapture.engine(engine)
  test_engine <- function(msg, ...){
    test_that(paste(engine, msg), ...)
  }

  name.value.vec <- c(
    "  sampleType=monocyte   assayType=H3K27me3    cost=5",
    "sampleType=monocyte assayType=H3K27ac",
    " sampleType=Myeloidcell cost=30.5  assayType=H3K4me3")

  name.value.pattern <- paste0(
    "(?P<name>[^ ]+?)",
    "=",
    "(?P<value>[^ ]+)")

  test_engine("name group used for rownames", {
    computed <- str_match_all_named(name.value.vec, name.value.pattern)
    expected <- list(
      cbind(value=c(sampleType="monocyte", assayType="H3K27me3", cost="5")),
      cbind(value=c(sampleType="monocyte", assayType="H3K27ac")),
      cbind(value=c(sampleType="Myeloidcell", cost="30.5", assayType="H3K4me3"))
    )
    expect_identical(computed, expected)
  })

  sample.assay.pattern <- paste0(
    "sampleType=",
    "(?P<sampleType>[^ ]+)",
    ".*",
    "assayType=",
    "(?P<name>[^ ]+)")

  test_engine("assayType used for rownames", {
    computed <- str_match_named(name.value.vec, sample.assay.pattern)
    expected <- cbind(
      sampleType=c(H3K27me3="monocyte",
                   H3K27ac="monocyte",
                   H3K4me3="Myeloidcell"))
    expect_identical(computed, expected)
  })

  named.subject <- c(
    first="  sampleType=monocyte   assayType=H3K27me3    cost=5",
    second="sampleType=monocyte assayType=H3K27ac",
    third=" sampleType=Myeloidcell cost=30.5  assayType=H3K4me3")

  test_engine("subject names used for rownames", {
    computed <- str_match_named(named.subject, sample.assay.pattern)
    expected <- cbind(
      sampleType=c(first="monocyte",
                   second="monocyte",
                   third="Myeloidcell"),
      name=c("H3K27me3", "H3K27ac", "H3K4me3"))
    expect_identical(computed, expected)
  })

  test_engine("subject names used for list names", {
    computed <- str_match_all_named(named.subject, name.value.pattern)
    expected <- list(
      first=cbind(value=c(sampleType="monocyte", assayType="H3K27me3", cost="5")),
      second=cbind(value=c(sampleType="monocyte", assayType="H3K27ac")),
      third=cbind(value=c(sampleType="Myeloidcell", cost="30.5", assayType="H3K4me3"))
    )
    expect_identical(computed, expected)
  })

  test_engine("subject names and group name used", {
    computed <- str_match_all_named(named.subject, sample.assay.pattern)
    expected <- list(
      first=cbind(sampleType=c(H3K27me3="monocyte")),
      second=cbind(sampleType=c(H3K27ac="monocyte")),
      third=cbind(sampleType=c(H3K4me3="Myeloidcell")))
    expect_identical(computed, expected)
  })

}
