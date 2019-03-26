context('util')

test_that('it should test extract_digit', {
	x <- extract_digit(4321, 4)
	expect_equal(x, 4)
	x <- extract_digit(1232, 10)
	expect_equal(x, 0)
	x <- extract_digit(1234, 2)
	expect_equal(x, 3)
	x <- extract_digit(1234, 1)
	expect_equal(x, 4)
})