
context("test validate_distancedata")
testdata <- data.frame(id = 1:5,
                       BEF = rep("FF",5),
                       Distance = rnorm(5))


test_that("correctly extracts distance column", {
    expect_equal(validate_distancedata(distance_data = testdata,max_distance = 3),3)
    expect_equal(validate_timedata(time_data = testdata),3)
})

test_that("Correctly returns null from blank argument",{
    expect_equal(is.null(validate_distancedata()),is.null(NULL))
    expect_equal(is.null(validate_timedata()),is.null(NULL))
})

f1 <- y ~ sex + Age + stap(Coffee_Shops)
a1 <- y ~ sex + Age
f2 <- y ~ tap_log(Fast_Food) + sex + Age + stap_log(Coffee_Shops)
a2 <- y ~ sex + Age
f3 <- cbind(y1,y2) ~ sex + Age + tap_log(Fast_Food)
a3 <- cbind(y1,y2) ~ sex + Age
f4 <- y ~ sex + Age + stap(Coffee_Shops) +(1|ID)
a4 <- y ~ sex + Age + (1|ID)
test_that("get_stapless_formula works",{
    expect_equal(get_stapless_formula(f1),a1)
    expect_error(get_stapless_formula(a1))
    expect_equal(get_stapless_formula(f2),a2)
    expect_equal(get_stapless_formula(f3),a3)
    expect_equal(get_stapless_formula(f4),a4)
})
