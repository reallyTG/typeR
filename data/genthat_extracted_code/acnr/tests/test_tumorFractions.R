context("Consistency of data sets with respect to tumor fractions")

test_that("Tumor fractions are in [0,1]", {
    for (dataSet in listDataSets()) {
        tfs <- listTumorFractions(dataSet)
        expect_false(any(is.na(tfs)))
        expect_true(all(tfs>=0))
        expect_true(all(tfs<=1))
        expect_true(1 %in% tfs)
    }
})
