context("Error and warning handling")

test_that("we can set and unset warning flags", {
    wflags <- warning_flags()
    expect_true(wflags$warn_on_unknown_function)
    expect_true(wflags$warn_on_local_function)

    wflags <- warning_flags() %>% unset_warn_on_unknown_function()
    expect_false(wflags$warn_on_unknown_function)
    expect_true(wflags$warn_on_local_function)
    wflags <- wflags %>% set_warn_on_unknown_function()
    expect_true(wflags$warn_on_unknown_function)
    expect_true(wflags$warn_on_local_function)

    wflags <- warning_flags() %>% unset_warn_on_local_function()
    expect_true(wflags$warn_on_unknown_function)
    expect_false(wflags$warn_on_local_function)
    wflags <- wflags %>% set_warn_on_local_function()
    expect_true(wflags$warn_on_unknown_function)
    expect_true(wflags$warn_on_local_function)
})
