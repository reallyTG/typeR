context('Test cattr2str')

test_that('Test cattr2str', {
    ca <- data.frame(month = c(2, 3, 5, 6), 
                          variable = c(rep('x', 3), 'y'),
                          used = c(TRUE, FALSE, TRUE, FALSE))
    expect_identical(cattr2str(ca), 
                     c('2_x_TRUE','3_x_FALSE','5_x_TRUE','6_y_FALSE'))
}
)
