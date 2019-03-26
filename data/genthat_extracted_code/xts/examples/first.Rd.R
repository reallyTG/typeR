library(xts)


### Name: first
### Title: Return First or Last n Elements of A Data Object
### Aliases: first first.default first.xts last last.default last.xts
### Keywords: utilities

### ** Examples

first(1:100)
last(1:100)

data(LakeHuron)
first(LakeHuron,10)
last(LakeHuron)

x <- xts(1:100, Sys.Date()+1:100)
first(x, 10)
first(x, '1 day')
first(x, '4 days')
first(x, 'month')
last(x, '2 months')
last(x, '6 weeks')



