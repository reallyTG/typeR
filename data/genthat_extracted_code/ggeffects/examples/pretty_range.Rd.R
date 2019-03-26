library(ggeffects)


### Name: pretty_range
### Title: Create a pretty sequence over a range of a vector
### Aliases: pretty_range

### ** Examples

library(sjmisc)
data(efc)

x <- std(efc$c12hour)
x
# pretty range for vectors with decimal points
pretty_range(x)

# pretty range for large range, increasing by 50
pretty_range(1:1000)

# increasing by 20
pretty_range(1:1000, n = 7)




