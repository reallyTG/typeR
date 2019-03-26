context('testing BootCI and related tools')

test_that('BootCI returns matrix when given list from BootGlmm', {
    x <- rnorm(10)
    y <- rnorm(10)
    xy_data = data.frame(x = x, y = y)
    simple_model <- lm(y ~ x, data = xy_data)

    list_out = BootGlmm(base_model = simple_model, resamples = 20, base_data = xy_data,
                        return_coefs_instead = TRUE)

    expect_equal(class(BootCI(list_out$base_coef_se,
                              list_out$resampled_coef_se)),
                 'matrix')
})

test_that('CombineResampledLists gives same result for list of lists, or one by one', {
    x <- rnorm(10)
    y <- rnorm(10)
    xy_data = data.frame(x = x, y = y)
    simple_model <- lm(y ~ x, data = xy_data)

    list_out1 = BootGlmm(base_model = simple_model, resamples = 20, base_data = xy_data,
                        return_coefs_instead = TRUE)
    list_out2 = BootGlmm(base_model = simple_model, resamples = 20, base_data = xy_data,
                        return_coefs_instead = TRUE)
    list_out3 = BootGlmm(base_model = simple_model, resamples = 20, base_data = xy_data,
                         return_coefs_instead = TRUE)

    expect_equal(CombineResampledLists(list_out1, list_out2, list_out3),
                 CombineResampledLists(list(list_out1, list_out2, list_out3)))
})
    
