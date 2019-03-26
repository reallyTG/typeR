
context('Test Returned Data Types')

test_that('Expect that predictions data prodcut query returns a data frame', {
    skip_on_cran()
    expect_is(query_coops_data('9414290',
                               '20170101',
                               '20170201',
                               data_product = 'predictions',
                               interval = 'hilo',
                               datum = 'MLLW'),
              'data.frame')

})

test_that("Test that the function returns a data frame for non-prediction data products", {
    skip_on_cran()
    expect_is(query_coops_data('9444900',
                               '20180601 15:00',
                               '20180601 17:00',
                               data_product = 'water_temperature',
                               interval = 'h'),
              'data.frame')
})

test_that('Test that the function can properly parse an error message', {
    skip_on_cran()
    expect_error(query_coops_data('9414290',
                                  '20170101',
                                  '20170101',
                                  'water_level')
                )
})

test_that('Test that station list returns a data frame', {
    skip_on_cran()
    expect_is(list_coops_stations(), 'data.frame')
})
