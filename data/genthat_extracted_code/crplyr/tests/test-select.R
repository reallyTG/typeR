context("'select' on CrunchDataset")

with_mock_crunch({
    ds <- loadDataset("test ds")
    test_that("Some facts about the fixture dataset", {
        expect_identical(names(ds),
            c("birthyr", "gender", "location", "mymrset", "textVar", "starttime", "catarray"))
    })

    test_that("Basic 'select' equivalence", {
        expect_identical(select(ds, starttime, birthyr, gender),
            ds[c("starttime", "birthyr", "gender")])
        expect_identical(select(ds, starts_with("m")),
            ds["mymrset"])
        expect_identical(select(ds, mymrset:starttime),
            ds[c("mymrset", "textVar", "starttime")])
    })

    test_that("Select then filter", {
        both <- ds %>%
            select(mymrset, starttime, gender) %>%
            filter(gender == "Male")
        expect_identical(both, ds[ds$gender == "Male", c("mymrset", "starttime", "gender")])
    })
})
