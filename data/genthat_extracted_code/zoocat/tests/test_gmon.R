
context('Test gmon')

test_that('Test gmon object should not lose the class attribute', {
    gm <- gmon(-10 : 10)
    expect_is(gm[1:3], 'gmon')
    expect_is(gm + 10, 'gmon')
})
