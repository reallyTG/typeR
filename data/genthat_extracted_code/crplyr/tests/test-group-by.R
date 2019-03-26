context("'group_by' on CrunchDataset")

groupVars <- function (dataset) sapply(groups(dataset), deparse)

with_mock_crunch({
    ds <- loadDataset("test ds")

    test_that("groups method on CrunchDataset", {
        expect_is(ds, "CrunchDataset")
        expect_identical(groups(ds), list())
        expect_identical(name(ds), "test ds")
    })
    test_that("group_by errors if assigned columns not in dataset", {
        expect_error(group_by(ds, catfish), "catfish is not present in the Dataset")
        expect_error(group_by(ds, catfish, dogfish), 
            "catfish, dogfish are not present in the Dataset")
    })

    ds2 <- group_by(ds, gender)
    test_that("group_by returns a GroupedCrunchDataset", {
        expect_is(ds2, "GroupedCrunchDataset")
        expect_identical(name(ds2), "test ds")
        expect_identical(groupVars(ds2), "gender")
        ds3 <- group_by(ds, gender, birthyr)
        expect_identical(groupVars(ds3), c("gender", "birthyr"))
    })

    test_that("ungroup", {
        expect_is(ungroup(ds2), "CrunchDataset")
        expect_false(inherits(ungroup(ds2), "GroupedCrunchDataset"))
        expect_identical(name(ungroup(ds2)), "test ds")
        expect_identical(groups(ungroup(ds)), list())
        expect_identical(groups(ungroup(ds2)), list())
        expect_identical(ungroup(ds2), ds)
    })

    test_that("'add' argument to group_by", {
        expect_identical(groupVars(group_by(ds2, birthyr)),
            "birthyr")
        expect_identical(groupVars(group_by(ds2, birthyr, add=TRUE)),
            c("gender", "birthyr"))
    })

    test_that("Grouping and filtering", {
        expect_identical(groupVars(filter(ds2, birthyr > 2000)), "gender")
        v1 <- ds %>% group_by(gender) %>% filter(birthyr > 2000)
        v2 <- ds %>% filter(birthyr > 2000) %>% group_by(gender)
        expect_identical(v1, v2)
        expect_output(print(crunch:::activeFilter(v1)), "birthyr > 2000")
        expect_output(print(crunch:::activeFilter(v2)), "birthyr > 2000")
    })

    test_that("ungroup preserves filtering", {
        v1 <- ds %>% group_by(gender) %>% filter(birthyr > 2000)
        expect_output(print(crunch:::activeFilter(v1)), "birthyr > 2000")
        expect_output(print(crunch:::activeFilter(ungroup(v1))), "birthyr > 2000")
    })

    test_that("If grouped, select preserves groups", {
        expect_identical(groupVars(select(ds2, birthyr, gender, starttime)),
            "gender")
    })
    test_that("Grouping helpers work on CrunchDatasets", {
        expect_null(group_vars(ds))
        expect_identical(tbl_vars(ds), names(ds))
    })
})
