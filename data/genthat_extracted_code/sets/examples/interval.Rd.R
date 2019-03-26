library(sets)


### Name: interval
### Title: Intervals
### Aliases: as.character.interval as.double.interval as.interval
###   as.interval.default as.interval.interval as.interval.list
###   as.interval.NULL as.interval.numeric as.interval.set
###   as.interval.tuple as.list.interval integers integers2reals interval
###   interval_complement interval_contains_element interval_difference
###   interval_division interval_domain interval_intersection
###   interval_is_bounded interval_is_closed interval_is_countable
###   interval_is_degenerate interval_is_empty interval_is_equal
###   interval_is_less_than_or_equal interval_is_greater_than_or_equal
###   interval_is_less_than interval_is_greater_than interval_is_finite
###   interval_is_half_bounded interval_is_left_bounded
###   interval_is_left_closed interval_is_left_open
###   interval_is_left_unbounded interval_is_proper
###   interval_is_proper_subinterval interval_is_right_bounded
###   interval_is_right_closed interval_is_right_open
###   interval_is_right_unbounded interval_is_subinterval
###   interval_is_unbounded interval_is_uncountable interval_measure
###   interval_power interval_product interval_sum interval_symdiff
###   interval_union is.interval max.interval mean.interval min.interval
###   naturals naturals0 range.interval reals reals2integers prod.interval
###   sum.interval %..% %<% %>% %<=% %>=%
### Keywords: math

### ** Examples

#### * general interval constructor

interval(1,5)
interval(1,5, "[)")
interval(1,5, "()")

## ambiguous notation -> use alternative style
sets_options("openbounds", "][")
interval(1,5, "()")
sets_options("openbounds", "()")

interval(1,5, domain = "Z")
interval(1L, 5L)

## degenerate interval
interval(3)

## empty interval
interval()

#### * reals
reals()
reals(1,5)
reals(1,5,"()")
reals(1) ## half-unbounded

## (auto-)complement
!reals(1,5)
interval_complement(reals(1,5), reals(2, Inf))

## combine/c(reals(2,4), reals(3,5))
reals(2,4) | reals(3,5)

## intersection
reals(2,4) & reals(3,5)

## overlapping intervals
reals(2,4) & reals(3,5)
reals(2,4) & reals(4,5,"(]")

## non-overlapping
reals(2,4) & reals(7,8)
reals(2,4) | reals(7,8)
reals(2,4,"[)") | reals(4,5,"(]")

## degenerated cases
reals(2,4) | interval()
c(reals(2,4), set())

reals(2,4) | interval(6)
c(reals(2,4), set(6), 9)

## predicates
interval_is_empty(interval())
interval_is_degenerate(interval(4))
interval_is_bounded(reals(1,2))
interval_is_bounded(reals(1,Inf)) ## !! FALSE, because extended reals
interval_is_half_bounded(reals(1,Inf))
interval_is_left_bounded(reals(1,Inf))
interval_is_right_unbounded(reals(1,Inf))
interval_is_left_closed(reals(1,Inf))
interval_is_right_closed(reals(1,Inf)) ## !! TRUE

reals(1,2) <= reals(1,5)
reals(1,2) < reals(1,2)
reals(1,2) <= reals(1,2,"[)")
reals(1,2,"[)") < reals(1,2)

#### * integers
integers()
naturals()
naturals0()

3 %..% 5
integers(3, 5)
integers(3, 5) | integers(6,9)
integers(3, 5) | integers(7,9)

interval_complement(naturals(), integers())

naturals() <= naturals0()
naturals0() <= integers()

## mix reals and integers
c(reals(2,5), integers(7,9))
interval_complement(reals(2,5), integers())
interval_complement(integers(2,5), reals())

try(interval_complement(integers(), reals()), silent = TRUE)
## infeasible --> error

integers() <= reals()
reals() <= integers()

### interval arithmetic
x <- interval(2,4)
y <- interval(3,6)
x + y
x - y
x * y
x / y

## summary functions
min(x, y)
max(y)
range(y)
mean(y)



