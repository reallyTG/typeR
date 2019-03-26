context('functions')

  test_that("conversions are correct", {
    expect_equal(0,                     bit2int(x2bit("00000000")))
    expect_equal(1,                     bit2int(x2bit("00000001")))
    expect_equal(-1,                    bit2int(x2bit("ffffffff")))
    expect_equal(.Machine$integer.max,  bit2int(x2bit("7fffffff")))
    expect_equal(-.Machine$integer.max, bit2int(x2bit("80000001")))
    expect_equal(strtoi("0x12345678"),  bit2int(x2bit("12345678")))
    expect_equal(12345678,              bit2int(x2bit("00bc614e")))
    expect_equal(-12345678,             bit2int(x2bit("ff439eb2")))
    expect_error(x2int(c("0001", "ffffffff")))
  })

test_that('qrandommaxint() gives expected output', {
  x <- qrandommaxint(2)
  expect_equal(2,         length(x))
  expect_equal("integer", class(x))
  expect_equal("integer", typeof(x))
  expect_equal("numeric", mode(x))
})

# [END]
