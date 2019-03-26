# phylotate
# Copyright (c) 2017 Daniel Beer
# Copyright (c) 2017, 2018 Anusha Beer
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

library(phylotate)

data(finches)
d <- mb_attrs(parse_annotated(finches))

check.column <- function (c) {
    if (length(c) != 24) { stop("Column is wrong size") }
    if (sum(is.na(c)) > 1) { stop("More than one non-NA value") }
}

check.column(d$prob)
check.column(d$prob_stddev)
check.column(d$length_mean)
check.column(d$length_median)
check.column(d$length_95_HPD_low)
check.column(d$length_95_HPD_high)
