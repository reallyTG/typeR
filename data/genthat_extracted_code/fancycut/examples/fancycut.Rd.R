library(fancycut)


### Name: fancycut
### Title: Like 'cut', turn a vector of numbers into a factor
### Aliases: fancycut

### ** Examples

fancycut(
  x = -10:10,
  Zero = 0,
  Small = '[0,2)',
  Medium = '[2,5]',
  Large = '(5,10]'
)

# The following examples are from Richie Cotton via
# https://www.rdocumentation.org/packages/fancycut/versions/0.1.1/topics/fancycut

# The tag = value syntax is useful.
x <- seq.int(0, 1, 0.25)
fancycut(x, low = '[0, 0.5]', high = '(0.5, 1]')

# Not all the values have to live in a bucket.
x <- seq.int(0, 1, 0.25)
fancycut(x, low = '(0.2, 0.3]', high = '(0.7, 0.8)')

# You can use unmatched.bucket to deal with these other intervals.
x <- seq.int(0, 1, 0.25)
fancycut(x, low = '(0.2, 0.3]', high = '(0.7, 0.8)', unmatched.bucket = 'other')

# To match a specific value, make the lower and upper bound the same number.
x <- seq.int(0, 1, 0.25)
fancycut(x, low = '[0, 0.5)', half = '[0.5,0.5]', high = '(0.5, 1]')

# To match NA values, use na.bucket.
x2 <- c(seq.int(0, 1, 0.25), NA)
fancycut(x2, low = '[0, 0.5)', high = '[0.5, 1]', na.bucket = 'missing')




