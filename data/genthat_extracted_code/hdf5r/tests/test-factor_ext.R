#############################################################################
##
## Copyright 2016 Novartis Institutes for BioMedical Research Inc.
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
#############################################################################

context("factor_ext")

test_that("Factor_ext", {
    test1 <- factor_ext(x=c("Test1", "Test2", "Test1"), values=c(0,1))
    test2 <- factor_ext(x=c("Test1", "Test2", "Test1"), values=c(1,2))

    ## make sure that test2 is coercible to a factor
    expect_true(!coercible_to_factor(test1))
    expect_true(coercible_to_factor(test2))

    test2_as_factor <- coerce_to_factor(test2)
    test2_factor <- factor(c("Test1", "Test2", "Test1"))
    expect_equal(test2_as_factor, test2_factor)

    expect_equal(levels(test1), c("Test1", "Test2"))
    expect_equal(values(test1), c(0,1))
    
    expect_true(all(test1 == c("Test1", "Test2", "Test1")))
    expect_true(!any(test1 != c("Test1", "Test2", "Test1")))

    test1[2] <- "Test1"
    expect_true(all(test1=="Test1"))

    ## concatenate
    test3 <- c(test1, test1)

    ## equality of factor with itself
    expect_true(all(test1==test1))

    ## test that the values are always ordered
    factor_misordered <- factor_ext(x=c("Test1", "Test2", "Test1"), values=c(1, 0), levels=c("Test2", "Test1"))
    expect_equal(values(factor_misordered), c(0,1))
    expect_equal(levels(factor_misordered), c("Test1", "Test2"))
})
