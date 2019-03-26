library(sitar)


### Name: timegap
### Title: Select equally spaced ages from a vector of ages
### Aliases: timegap timegap.id diffid timegap.id diffid

### ** Examples

data(heights)

## bin age into 1-year groups by id
## gives multiple measurements per id per year
with(heights, table(floor(age), id))

## now select heights measured multiples of 1 year apart
(tg1 <- timegap.id(age, id, heights, 1))

## no more than one measurement per id per year
with(heights[tg1, ], table(floor(age), id))

## most time intervals close to 1 year
summary(diffid(age, id, heights[tg1, ], lag=1))



