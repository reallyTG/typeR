library(fancycut)


### Name: wafflecut
### Title: Like 'cut', turn a vector of numbers into a factor
### Aliases: wafflecut

### ** Examples



wafflecut(-10:10, c('[0,2)','[2,5)','[5,10]'), c('Small','Medium','Large'))

wafflecut(-10:10, c('[0,0]','(0,2]','(2,5)','[5,10]'), c('Zero','Small','Medium','Large'))

wafflecut(-10:10, c('[0,2)','[2,5)','[5,10]'), c('Small','Medium','Large'))

wafflecut(-10:10, c('[0,0]','[0,2]','(2,5)','[5,10]'), c('Zero','Small','Medium','Large'))


# The following examples are from Richie Cotton via
# https://www.rdocumentation.org/packages/fancycut/versions/0.1.1/topics/fancycut

# Not all the values have to live in a bucket.
x <- seq.int(0, 1, 0.25)
wafflecut(x, c('(0.2, 0.3)', '(0.7, 0.8)'), c('low', 'high'))

# You can use unmatched.bucket to deal with these other intervals.
x <- seq.int(0, 1, 0.25)
wafflecut(x, c('(0.2, 0.3)', '(0.7, 0.8)'), c('low', 'high'), unmatched.bucket = 'other')

# To match NA values, use na.bucket.
x2 <- c(seq.int(0, 1, 0.25), NA)
wafflecut(x2, c('[0, 0.5)', '[0.5, 1]'), c('low', 'high'), na.bucket = 'missing')





