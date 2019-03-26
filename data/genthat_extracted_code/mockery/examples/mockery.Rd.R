library(mockery)


### Name: mockery
### Title: R package to make mocking easier
### Aliases: mockery mockery-package

### ** Examples

library(mockery)

m <- mock(TRUE, FALSE, TRUE)

# this will make summary call our mock function rather then
# UseMethod; thus, summary() will return values as above
stub(summary, 'UseMethod', m)

summary(iris) # returns TRUE
summary(cars) # returns FALSE
summary(co2)  # returns TRUE

## Not run: 
##D library(testthat)
##D 
##D m <- mock(TRUE)
##D f <- function() read.csv('data.csv')
##D 
##D with_mock(read.csv = m, {
##D   f()
##D   expect_call(m, 1, read.csv('data.csv'))
##D })
## End(Not run)



