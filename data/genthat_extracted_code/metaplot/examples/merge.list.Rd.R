library(metaplot)


### Name: merge.list
### Title: Merge Two Lists
### Aliases: merge.list
### Keywords: internal

### ** Examples

foo <- list(
  a = list(         # substituted by name
    col = 'red',    # substituted by name
    lty = 'dashed', # substituted by name
    alpha = 1,      # preserved
    8,              # preserved, since element 4 in replacement matches by name
    9               # substituted by position
  ),
  letters[8:10],    # preserved, siince elment 2 in replacement matches by name
  b = 3
)

bar <- list(
  letters[11:13],  # ignored: position conflict with named element
  b = 2,           # substituted by name
  a = list(        # substituted by name
    'blue',        # ignored: position conflict with named element
    col = 'green', # substituted by name
    lty = 'solid', # substituted by name
    lwd = 2,       # added by name
    3,             # substituted by postion
    4,             # added by postion
    hue = 5        # added by name
  ),
  'baz'            # added by postion
)

foo
bar
merge(foo,bar)
merge(list(1), list(2,foo = 3)) # 3 is assigned and named
merge(list(1), list(foo = 2,3)) # 3 is ignored since position 2 has been named by time of evaluation
merge(list(foo = 1), list(2,foo = 3)) # 2 ignored since pos. matches named argument; 3 overwrites
merge(list(foo = 1), list(2,3)) # 2 is ignored since position matches a named argument; 3 added



