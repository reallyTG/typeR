# Test that the odk2openVA returns a data frame of the appropriate size
# with no factors (which may cause problems with openVA).

context("Test return object.")

test_that("odk2openVA_v151 returns data frame with the right characteristics", {

    record_f_name151 <- system.file("sample",
                                    "who151_odk_export.csv",
                                    package = "CrossVA")
    records151 <- read.csv(record_f_name151, stringsAsFactors = FALSE)
    output151 <- odk2openVA(records151)

    expect_true(is.data.frame(output151))
    expect_equal(ncol(output151), 354)
    for (i in 1:354) {
        expect_false(is.factor(output151[, i]))
    }
})

test_that("odk2openVA_v141 returns data frame with the right characteristics", {

    record_f_name141 <- system.file("sample",
                                    "who141_odk_export.csv",
                                    package = "CrossVA")
    records141 <- read.csv(record_f_name141, stringsAsFactors = FALSE)
    output141 <- odk2openVA(records141)

    expect_true(is.data.frame(output141))
    expect_equal(ncol(output141), 354)
    for (i in 1:354) {
        expect_false(is.factor(output141[, i]))
    }
})
