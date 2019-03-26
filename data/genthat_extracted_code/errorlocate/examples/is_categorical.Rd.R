library(errorlocate)


### Name: is_categorical
### Title: Check if rules are categorical
### Aliases: is_categorical

### ** Examples

v <- validator( A %in% c("a1", "a2")
              , B %in% c("b1", "b2")
              , if (A == "a1") B == "b1"
              , y > x
              )

is_categorical(v)



