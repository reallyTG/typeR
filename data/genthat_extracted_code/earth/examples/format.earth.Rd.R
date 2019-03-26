library(earth)


### Name: format.earth
### Title: Format earth objects
### Aliases: format.earth
### Keywords: models

### ** Examples

earth.mod <- earth(Volume ~ ., data = trees)
cat(format(earth.mod))

# yields:
#    37.9
#    -  3.92 * h(16-Girth)
#    +   7.4 * h(Girth-16)
#    + 0.484 * h(Height-75)

cat(format(earth.mod, style="pmax"))

# yields:
#    37.9
#    -  3.92 * pmax(0,     16 -  Girth)
#    +   7.4 * pmax(0,  Girth -     16)
#    + 0.484 * pmax(0, Height -     75)

cat(format(earth.mod, style="C"))

# yields (note zero based indexing):
#  37.927
#    -  3.9187 * max(0,   16 - x[0])
#    +  7.4011 * max(0, x[0] -   16)
#    + 0.48411 * max(0, x[1] -   75)

cat(format(earth.mod, style="bf"))

# yields:
#    37.9
#    -  3.92 * bf1
#    +   7.4 * bf2
#    + 0.484 * bf3
#
#     bf1  h(16-Girth)
#     bf2  h(Girth-16)
#     bf3  h(Height-75)



