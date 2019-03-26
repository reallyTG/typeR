context("Consistency of internal data sets")

requiredColnames <- function(dataSet, expected) {
    dat <- loadCnRegionData(dataSet=dataSet)
    for (ee in expected)
        expect_true(ee %in% names(dat))
}

test_that("Required column names are present", {
    for (dataSet in listDataSets()) {
        requiredColnames(dataSet, expected=c("c", "b", "genotype", "region", "cellularity"))
    }
})

annotationConsistency <- function(dataSet) {
    tfs <- listTumorFractions(dataSet)
    tf1 <- tfs[1]
    dat <- loadCnRegionData(dataSet=dataSet, tumorFraction=tf1)
    geno <- dat[["genotype"]]
    reg <- dat[["region"]]

    for (tf in tfs[-1]) {
        dat <- loadCnRegionData(dataSet=dataSet, tumorFraction=tf)
        expect_identical(dat[["genotype"]], geno)
        expect_identical(dat[["region"]], reg)
    }
}

test_that("Sample annotations are consistent across dilution experiments", {
    for (dataSet in listDataSets()) {
        annotationConsistency(dataSet)
    }
})

