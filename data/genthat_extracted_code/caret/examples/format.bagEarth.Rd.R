library(caret)


### Name: format.bagEarth
### Title: Format 'bagEarth' objects
### Aliases: format.bagEarth
### Keywords: models

### ** Examples


a <- bagEarth(Volume ~ ., data = trees, B= 3)
format(a)

# yields:
# (
#   31.61075 
#   +  6.587273 * pmax(0,  Girth -   14.2) 
#   -  3.229363 * pmax(0,   14.2 -  Girth) 
#   - 0.3167140 * pmax(0,     79 - Height) 
#   +
#    22.80225 
#   +  5.309866 * pmax(0,  Girth -     12) 
#   -  2.378658 * pmax(0,     12 -  Girth) 
#   +  0.793045 * pmax(0, Height -     80) 
#   - 0.3411915 * pmax(0,     80 - Height) 
#   +
#    31.39772 
#   +   6.18193 * pmax(0,  Girth -   14.2) 
#   -  3.660456 * pmax(0,   14.2 -  Girth) 
#   + 0.6489774 * pmax(0, Height -     80) 
# )/3




