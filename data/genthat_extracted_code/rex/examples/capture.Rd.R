library(rex)


### Name: capture
### Title: Create a capture group
### Aliases: capture . capture_group

### ** Examples


# Match paired quotation marks
re <- rex(
  # first quotation mark
  capture(quotes),

  # match all non-matching quotation marks
  zero_or_more(except(capture_group(1))),

  # end quotation mark (matches first)
  capture_group(1)
)

#named capture - don't match apples to oranges
re <- rex(
  capture(name = "fruit", or("apple", "orange")),
  "=",
  capture_group("fruit")
)



