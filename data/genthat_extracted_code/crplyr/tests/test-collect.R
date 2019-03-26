context("'collect' on CrunchDataset")

with_mock_crunch({
    ds <- loadDataset("test ds")
    expected_df <- data_frame(
        birthyr = c(0.57753, -1.0201, -1.4967, -1.1101, 
            0.70392, 1.6662, -0.50294, 0.8415, 0.37829, -0.74401, -0.037001, 
            1.0487, 0.64628, -1.2774, -0.79363, -0.18147, 0.19587, 0.19104, 
            0.35474, -1.4009, -0.76175, -0.65557, 0.7368, -0.41492, -0.3103), 
        gender = structure(c(2L, 2L, NA, 2L, 2L, 2L, 1L, NA, NA, 2L, 
            1L, 2L, 1L, NA, NA, NA, 2L, 2L, 2L, NA, 1L, 1L, 1L, NA, 1L), 
            .Label = c("Male", "Female"), class = "factor")
        )
    
    expected_mr_df <- data_frame(
        gender = structure(c(2L, 2L, NA, 2L, 2L, 2L, 1L, NA, NA, 2L, 
            1L, 2L, 1L, NA, NA, NA, 2L, 2L, 2L, NA, 1L, 1L, 1L, NA, 1L), 
            .Label = c("Male", "Female"), class = "factor"),
        subvar2 = structure(c(2L, 2L, 1L, NA, 
            1L, 2L, 1L, 2L, 2L, 2L, NA, 2L, NA, NA, 1L, 1L, 2L, 2L, 2L, 1L, 
            NA, 1L, NA, NA, 1L), .Label = c("0.0", "1.0"), class = "factor"), 
        subvar1 = structure(c(1L, 1L, 2L, NA, NA, NA, NA, 
            1L, 2L, NA, NA, 1L, NA, NA, NA, 1L, 2L, 1L, 1L, 1L, NA, 1L, 
            NA, 1L, 2L), .Label = c("0.0", "1.0"), class = "factor"), 
        subvar3 = structure(c(1L, NA, 1L, 2L, NA, 1L, 2L, 
            NA, 1L, NA, 2L, 1L, 1L, 2L, 1L, 1L, 2L, 1L, NA, 1L, 2L, 1L, 
            1L, 1L, 2L), .Label = c("0.0", "1.0"), class = "factor")
        )
    test_that("collect works as expected", {
        expect_equal(
            ds %>% 
                select(gender, birthyr) %>% 
                collect(),
            expected_df
        )
    })
    test_that("correct works with MR variables", {
        mr_df <- ds %>% 
            select(gender, mymrset) %>% 
            collect()
        expect_equal(mr_df, expected_mr_df)
    })
    test_that("collect preserves grouping", {
        ds2 <- ds %>% 
            group_by(gender, birthyr) %>% 
            select(gender, birthyr) %>% 
            collect()
        expect_identical(group_vars(ds2), c("gender", "birthyr"))
    })
    test_that("collect doesn't affect dplyr methods", {
        expect_identical(mtcars, collect(mtcars))
    })
})