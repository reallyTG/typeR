context('CNPJ')

test_that('it should instanciate a CNPJ', {
	x <- CNPJ("13.515.463/0001-38")
	expect_is(x, 'CNPJ')
	x <- CNPJ("13515463000138")
	expect_is(x, 'CNPJ')
	x <- CNPJ(13515463000138)
	expect_is(x, 'CNPJ')
	x <- CNPJ(c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00"))
	expect_is(x, 'CNPJ')
})

test_that('it should not instanciate a CNPJ', {
	expect_error(CNPJ(NULL), 'Unsupported type')
})

test_that('it should check how CNPJ is stored internally', {
	x <- CNPJ("13.515.463/0001-38")
	expect_equal(unclass(x), "13515463000138")
	x <- CNPJ(13515463000138)
	expect_equal(unclass(x), "13515463000138")
	x <- CNPJ(66670000100)
	expect_equal(unclass(x), "00066670000100")
	x <- CNPJ(c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00"))
	expect_equal(unclass(x), c("13515463000138", "03737211000108",
		"00360305000104", "00066670000100"))
})

test_that('it should format CNPJ', {
	x <- CNPJ("13.515.463/0001-38")
	expect_equal(format(x), "13.515.463/0001-38")
	x <- CNPJ(66670000100)
	expect_equal(format(x), "00.066.670/0001-00")
	expect_equal(format(x, "strict"), "00.066.670/0001-00")
	expect_equal(format(x, "stripped"), "00066670000100")
	x <- CNPJ(c(13515463000138, 3737211000108, 360305000104, 66670000100))
	expect_equal(format(x), c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00"))
})

test_that('it should convert CNPJ into numeric', {
	x <- CNPJ("13.515.463/0001-38")
	expect_equal(as.numeric(x), 13515463000138)
	x <- CNPJ("00.066.670/0001-00")
	expect_equal(as.numeric(x), 66670000100)
	x <- CNPJ(c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00"))
	expect_equal(as.numeric(x), c(13515463000138, 3737211000108, 360305000104, 66670000100))
})

test_that('it should convert CNPJ into character', {
	x <- CNPJ(13515463000138)
	expect_equal(as.character(x), "13.515.463/0001-38")
	x <- CNPJ(66670000100)
	expect_equal(as.character(x), "00.066.670/0001-00")
	x <- CNPJ(c(13515463000138, 3737211000108, 360305000104, 66670000100))
	expect_equal(as.character(x), c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00"))
})

test_that('it should validate CNPJ', {
	x <- CNPJ(13515463000138)
	expect_true(is.valid(x))
	x <- CNPJ(66670000100)
	expect_true(is.valid(x))
	x <- CNPJ(66670000101)
	expect_false(is.valid(x))
	x <- CNPJ(c(13515463000138, 3737211000108, 360305000104, 66670000100))
	expect_true(all(is.valid(x)))
	x <- CNPJ(c(13515463000138, 66670000101))
	expect_equal(is.valid(x), c(T, F))
})

test_that('it should CNPJ`s equality', {
	x <- CNPJ(13515463000138)
	expect_true(x == '13515463000138')
	expect_true(x == 13515463000138)
	expect_true(x == "13.515.463/0001-38")
	expect_false(x != "13.515.463/0001-38")
	expect_false(x == 66670000100)
	expect_true(x != 66670000100)
	x <- CNPJ(c(13515463000138, 3737211000108, 360305000104, 66670000100))
	expect_true(all( x == c("13.515.463/0001-38", "03.737.211/0001-08",
		"00.360.305/0001-04", "00.066.670/0001-00") ))
})

