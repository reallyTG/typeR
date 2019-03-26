library(itertools2)


### Name: ifilter
### Title: Iterator that filters elements not satisfying a predicate
###   function
### Aliases: ifilter ifilterfalse

### ** Examples

# Filters out odd numbers and retains only even numbers
is_even <- function(x) {
  x %% 2 == 0
}
it <- ifilter(is_even, 1:10)
as.list(it)

# Similar idea here but anonymous function is used to filter out even
# numbers
it2 <- ifilter(function(x) x %% 2 == 1, 1:10)
iterators::nextElem(it2) # 1
iterators::nextElem(it2) # 3
iterators::nextElem(it2) # 5
iterators::nextElem(it2) # 7
iterators::nextElem(it2) # 9

is_vowel <- function(x) {
  x %in% c('a', 'e', 'i', 'o', 'u')
}
it3 <- ifilter(is_vowel, letters)
as.list(it3)
# Filters out even numbers and retains only odd numbers
is_even <- function(x) {
  x %% 2 == 0
}
it <- ifilterfalse(is_even, 1:10)
as.list(it)

# Similar idea here but anonymous function is used to filter out odd
# numbers
it2 <- ifilter(function(x) x %% 2 == 1, 1:10)
as.list(it2)

is_vowel <- function(x) {
  x %in% c('a', 'e', 'i', 'o', 'u')
}
it3 <- ifilterfalse(is_vowel, letters)
iterators::nextElem(it3) # b
iterators::nextElem(it3) # c
iterators::nextElem(it3) # d
iterators::nextElem(it3) # f
iterators::nextElem(it3) # g
# iterators::nextElem(it) continues through the rest of the consonants



