library(invctr)


### Name: extractors
### Title: Extract vectors by index or value occurrence
### Aliases: extractors %[f% %[l% %[% %]% %f]% %l]% %q]% %q)% %[q% %(q% %:%

### ** Examples


z <- letters

# Extract front by first occurrence of value
z %[f% "n"

# Extract front by index
x <- rnorm(100)
x %[% 10

# Extract rear by index
x %]% 90

# Extract rear by index
x %]% 90

# Extract by indices if a range is provided
x %]% c(4,30)
z %[% c(6,10)

# Extract last/middle value of x
x %:% "l"
z %:% "m"

# Extract by percentile
seq(1,10,.5) %(q% .5 # infix
seq(1,10,.5)[seq(1,10,.5) < quantile(seq(1,10,.5),.5)] # regular syntax

seq(1,10,.5) %q]% .5 # infix
seq(1,10,.5)[seq(1,10,.5) >= quantile(seq(1,10,.5),.5)] # regular syntax





