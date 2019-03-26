context("'filter' on CrunchDataset")

with_mock_crunch({
    ds <- loadDataset("test ds")
    test_that("Some facts about the fixture dataset", {
        expect_identical(names(ds),
            c("birthyr", "gender", "location", "mymrset", "textVar", "starttime", "catarray"))
    })

    test_that("Basic filter method", {
        expect_identical(filter(ds, gender == "Male"),
            ds[ds$gender == "Male",])
        expect_identical(filter(ds, gender == "Male" | birthyr > 2000),
            ds[ds$gender == "Male" | ds$birthyr > 2000,])
        expect_identical(filter(ds, gender == "Male" & birthyr > 2000),
            ds[ds$gender == "Male" & ds$birthyr > 2000,])
    })

    test_that("Comma-separated filters", {
        expect_identical(filter(ds, gender == "Male", birthyr > 2000),
            ds[ds$gender == "Male" & ds$birthyr > 2000,])
    })

    test_that("Filter then select", {
        both <- ds %>%
            filter(gender == "Male") %>%
            select(mymrset, starttime)
        expect_identical(both, ds[ds$gender == "Male", c("mymrset", "starttime")])
    })
})
