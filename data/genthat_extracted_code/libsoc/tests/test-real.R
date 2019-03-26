context('real')

# Roundtrip test of real type
num <- 3.5

of <- so_OFMeasures$new()
of$Deviance <- num

new_num <- of$Deviance

expect_identical(new_num, num)    # Can use equal as 3.5 has exact representation in floating point