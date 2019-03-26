context('Testing that GetRand behaves as expected')

test_that('GetRand gives correct output', {

    expect_equal(GetRand('y ~ age + (1 | school)'),
                 'school')

    expect_equal(GetRand('y ~ income + (1 | school) + (1 | school:section)'),
                 c('school', 'section'))
    
    expect_equal(GetRand('y ~ income + (1 | school) + (1 | school/section)'),
                 c('school', 'section'))
    
    expect_equal(GetRand(as.formula('y ~ x + (1 | z)')),
                 'z')

    ## i.e. empty vector
    expect_equal(GetRand('y ~ x'),
                 vector(mode = 'character'))
})
