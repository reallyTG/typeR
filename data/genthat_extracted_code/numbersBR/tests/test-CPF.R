context('CPF')

test_that('it should instanciate a CPF', {
	x <- CPF("68194359406")
	expect_is(x, 'CPF')
	x <- CPF("681.943.594-06")
	expect_is(x, 'CPF')
	x <- CPF(68194359406)
	expect_is(x, 'CPF')
	x <- CPF(c(68194359406, 1239157673, 52008275582))
	expect_is(x, 'CPF')
})

test_that('it should not instanciate a CPF', {
	expect_error(CPF(NULL), 'Unsupported type')
})

test_that('it should check how CPF is stored internally', {
	x <- CPF("68194359406")
	expect_equal(unclass(x), "68194359406")
	x <- CPF(1239157673)
	expect_equal(unclass(x), "01239157673")
	x <- CPF(c("681.943.594-06", "012.391.576-73", "520.082.755-82"))
	expect_equal(unclass(x), c("68194359406", "01239157673", "52008275582"))
})

test_that('it should format CPF', {
	x <- CPF("681.943.594-06")
	expect_equal(format(x), "681.943.594-06")
	x <- CPF(1239157673)
	expect_equal(format(x, "strict"), "012.391.576-73")
	expect_equal(format(x, "stripped"), "01239157673")
	x <- CPF(c(68194359406, 1239157673, 52008275582))
	expect_equal(format(x), c("681.943.594-06", "012.391.576-73", "520.082.755-82"))
})

test_that('it should convert CPF into numeric', {
	x <- CPF("681.943.594-06")
	expect_equal(as.numeric(x), 68194359406)
	x <- CPF("01239157673")
	expect_equal(as.numeric(x), 1239157673)
	x <- CPF(c("681.943.594-06", "012.391.576-73", "520.082.755-82"))
	expect_equal(as.numeric(x), c(68194359406, 1239157673, 52008275582))
})

test_that('it should convert CPF into character', {
	x <- CPF(68194359406)
	expect_equal(as.character(x), "681.943.594-06")
	x <- CPF(1239157673)
	expect_equal(as.character(x), "012.391.576-73")
	x <- CPF(c(68194359406, 1239157673, 52008275582))
	expect_equal(as.character(x), c("681.943.594-06", "012.391.576-73", "520.082.755-82"))
})

test_that('it should CPF`s equality', {
	x <- CPF(68194359406)
	expect_true(x == 68194359406)
	expect_true(x == x)
	expect_true(x == "681.943.594-06")
	expect_false(x != "681.943.594-06")
	expect_false(x == "012.391.576-73")
	expect_true(x != 1239157673)
	x <- CPF(c(68194359406, 1239157673, 52008275582))
	expect_true(all( x == c("681.943.594-06", "012.391.576-73", "520.082.755-82") ))
})

test_that('it should validate CPF', {
	x <- CPF(68194359406)
	expect_true(is.valid(x))
	x <- CPF(1239157673)
	expect_true(is.valid(x))
	x <- CPF(42752486198)
	expect_false(is.valid(x))
	x <- CPF(c(68194359406, 1239157673))
	expect_true(all(is.valid(x)))
	x <- CPF(c(1239157673, 42752486198))
	expect_equal(is.valid(x), c(T, F))
})

