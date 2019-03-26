#"Copyright© 2018 Merck Sharp & Dohme Corp. a subsidiary of Merck & Co., Inc., Kenilworth, NJ, USA."
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#
context(desc = 'checking input parameters')
test_that('checking x', {
    expect_that(EvaluateRules(), throws_error(regexp = "argument 'x' is missing, with no default"))
    expect_that(EvaluateRules(x = as.data.frame(1:3)), throws_error(regexp = 'x must be vector!'))
    expect_that(EvaluateRules(x = c('a', 'b', 'c')), throws_error(regexp = 'column x is not numeric!'))
    expect_that(EvaluateRules(x = c(15)), throws_error(regexp = 'vector x is to short!'))
})
test_that('checking type',{
    expect_that(EvaluateRules(x = 1:10, type = c('c','i')), throws_error('type must be single character!'))
    expect_that(EvaluateRules(x = 1:10, type = 'f'), throws_error('wrong type of chart'))
    expect_that(EvaluateRules(x = 1:10, type = '5'), throws_error('wrong type of chart'))
    expect_that(EvaluateRules(x = -10:10, type = 'c'), throws_error('count data can not contain negative values'))
    expect_that(EvaluateRules(x = 1:10, type = 'c', whichRules = 5), throws_error('At least one rule from 1 to 4 must be specified for c-chart'))
})
test_that('checking whichRules',{
    expect_that(EvaluateRules(x = 1:10, whichRules = as.data.frame(c(1,2,"4"))), throws_error('whichRules must be vector!'))
    expect_that(EvaluateRules(x = 1:10, whichRules = numeric()), throws_error('At least one rule must be specified'))
    expect_that(EvaluateRules(x = 1:10, whichRules = c(1,2,"4")), throws_error('whichRules is not numeric!'))
    expect_that(EvaluateRules(x = 1:10, whichRules = c(1:10)), throws_error('whichRules must contation integers in range 1..8'))
})
test_that('checking LCL, CL, UCL',{
    expect_that(EvaluateRules(x = 1:10, lcl = c(5,5)), throws_error('limits lcl, cl and ucl must contain only single value'))
    expect_that(EvaluateRules(x = 1:10, lcl = 'd'), throws_error('parameter lcl must contain only numeric value or NA'))
})
test_that('checking parRules',{
    pars = SetParameters()
    pars$Rule3$convention = 'min'
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error("parameter convention in Rule3 does not match 'minitab' or 'jmp'"))
    pars = SetParameters()
    pars$Rule4$convention = 'min'
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error("parameter convention in Rule4 does not match 'minitab' or 'jmp'"))
    pars = SetParameters()
    pars$Rule3$equalBreaksSeries = 'L'
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error('parameter equalBreaksSeries in Rule3 is not logical'))
    pars = SetParameters()
    pars$Rule2$nPoints = c(1,2)
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error('parameter must contain only a single value'))
    pars = SetParameters()
    pars$Rule2$nPoints = -5
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error('parameter must be a positive integer'))
    pars = SetParameters()
    pars$Rule2$nPoint = 5
    expect_that(EvaluateRules(x = 1:10, parRules = pars), throws_error('error in structure of parRules'))
})
test_that('checking sides', {
    pars = SetParameters()
    pars$Rule1$sides = 'upp'
    expect_that(EvaluateRules(x = 1:10, whichRules = 1,ucl = 8,parRules = pars) , throws_error("parameter sides in Rule1 does not match 'two-sided', 'upper' or 'lower'"))
})
test_that('checking controlLimitDistance',{
    expect_that(EvaluateRules(x = 1:10, controlLimitDistance = c(3,3)), throws_error('controlLimitDistance must be a single value'))
    expect_that(EvaluateRules(x = 1:10, controlLimitDistance = -1), throws_error('parameter must be only 1,2 or 3'))
    expect_that(EvaluateRules(x = 1:10, controlLimitDistance = NA), throws_error('parameter must be only 1,2 or 3 not NA'))

})
test_that('checking returnAllSelectedRules',{
    expect_that(EvaluateRules(x = 1:10, type = "c", returnAllSelectedRules = c(TRUE,TRUE)),throws_error('returnAllSelectedRules must be a single value'))
    expect_that(EvaluateRules(x = 1:10, type = "c", returnAllSelectedRules = "a"), throws_error('parameter must be logical, either TRUE or FALSE'))
    expect_that(EvaluateRules(x = 1:10, type = "c", returnAllSelectedRules = NA), throws_error('parameter must be logical, either TRUE or FALSE'))
    expect_that(EvaluateRules(x = 1:10, type = "c", returnAllSelectedRules = 2), throws_error('parameter must be logical, either TRUE or FALSE'))

})
context(desc = 'checking limits calculation')
test_that('None of the limits provided',{
    st.dev = sd(c(0,1,2,3,4,5,6))
    expect_equal(CalculateLimits(x = c(0,1,2,3,4,5,6), type = 'i', controlLimitDistance = 3), list(ucl=3 + 3*st.dev, cl=3, lcl=3-3*st.dev))
    expect_equal(CalculateLimits(x = c(0,1,2,3,4,5,6), type = 'i', controlLimitDistance = 2), list(ucl=3 + 2*st.dev, cl=3, lcl=3-2*st.dev))
    expect_equal(CalculateLimits(x = c(0,1,2,3,4,5,6), type = 'i', controlLimitDistance = 1), list(ucl=3 + st.dev, cl=3, lcl=3-st.dev))
})
test_that('Two limits provided',{
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'i',ucl = 100, cl = 50, lcl = NA), list(ucl=100, cl=50, lcl=0))
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'i',ucl = NA, cl = 50, lcl = 0), list(ucl=100, cl=50, lcl=0))
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'i',ucl = 100, cl = NA, lcl = 0), list(ucl=100, cl=50, lcl=0))
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'c',ucl = 100, cl = 50, lcl = NA), list(ucl=100, cl=50, lcl=0))
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'c',ucl = NA, cl = 50, lcl = 0), list(ucl=100, cl=50, lcl=0))
    expect_equal(CalculateLimits(x = c(1,1,1), type = 'c',ucl = 100, cl = NA, lcl = 0), list(ucl=100, cl=50, lcl=0))
})
test_that('LCL provided',{
    data = c(1,1,2,2,3,3)
    cl=mean(data)
    lcl=1
    ucl = cl + (cl - lcl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'i',ucl = NA, cl = NA, lcl = 1), limits)
    expect_equal(CalculateLimits(x = data, type = 'c',ucl = NA, cl = NA, lcl = 1), limits)
})
test_that('UCL provided',{
    data = c(1,1,2,2,3,3)
    cl=mean(data)
    ucl=3
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'i',ucl = 3, cl = NA, lcl = NA), limits)
    expect_equal(CalculateLimits(x = data, type = 'c',ucl = 3, cl = NA, lcl = NA), limits)
})
test_that('CL provided',{
    # controlLimitDistance = 3
    # i-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + 3*sd(data, na.rm = T)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'i',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 3), limits)
    # c-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + 3*sqrt(cl)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'c',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 3), limits)
    # controlLimitDistance = 2
    # i-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + 2*sd(data, na.rm = T)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'i',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 2), limits)
    # c-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + 2*sqrt(cl)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'c',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 2), limits)
    # controlLimitDistance = 1
    # i-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + sd(data, na.rm = T)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'i',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 1), limits)
    # c-chart
    data = c(1,1,2,2,3,3)
    cl= 2
    ucl = cl + sqrt(cl)
    lcl = cl - (ucl - cl)
    limits = list(ucl= ucl , cl= cl, lcl= lcl)
    expect_equal(CalculateLimits(x = data, type = 'c',ucl = NA, cl = 2, lcl = NA, controlLimitDistance = 1), limits)

})
context(desc = 'checking Rule1 optional parameter sides')
test_that('upper',{
    pars = SetParameters()
    pars$Rule1$sides = 'upper'
    expect_equal(EvaluateRules(x = 1:10, whichRules = 1,ucl = 8,parRules = pars)[,2], c(0,0,0,0,0,0,0,0,1,1))
})
test_that('lower',{
    pars = SetParameters()
    pars$Rule1$sides = 'lower'
    expect_equal(EvaluateRules(x = 1:10, whichRules = 1,lcl = 3,parRules = pars)[,2], c(1,1,0,0,0,0,0,0,0,0))
})
context(desc = 'checking returnAllSelectedRules')
test_that('only rules 1-4 returned',{
    expectedColumns = c("x","Rule1","Rule2","Rule3","Rule4")
    expect_equal(colnames(EvaluateRules(x = 1:10, type = "c", whichRules = 1:8, returnAllSelectedRules = F)), expectedColumns)
})
test_that('all rules 1-8 returned',{
    expectedColumns = c("x","Rule1","Rule2","Rule3","Rule4","Rule5","Rule6","Rule7","Rule8")
    expect_equal(colnames(EvaluateRules(x = 1:10, type = "c", whichRules = 1:8, returnAllSelectedRules = T)), expectedColumns)
})










