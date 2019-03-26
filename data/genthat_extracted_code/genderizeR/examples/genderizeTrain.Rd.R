library(genderizeR)


### Name: genderizeTrain
### Title: Training genderize function
### Aliases: genderizeTrain

### ** Examples

## Not run: 
##D 
##D x = c('Alex', 'Darrell', 'Kale', 'Lee', 'Robin', 'Terry', 'John', 'Tom')
##D y = c(rep('male',length(x)))
##D 
##D givenNamesDB = findGivenNames(x)
##D probs = seq(from =  0.5, to = 0.9, by = 0.1)
##D counts = c(1, 10)
##D 
##D genderizeTrain(x = x, y = y, 
##D                givenNamesDB = givenNamesDB, 
##D                probs = probs, counts = counts, 
##D                parallel = TRUE) 
##D 
##D #     prob count errorCoded errorCodedWithoutNA naCoded errorGenderBias
##D #  1:  0.5     1      0.125               0.125   0.000           0.125
##D #  2:  0.6     1      0.125               0.000   0.125           0.000
##D #  3:  0.7     1      0.125               0.000   0.125           0.000
##D #  4:  0.8     1      0.375               0.000   0.375           0.000
##D #  5:  0.9     1      0.500               0.000   0.500           0.000
##D #  6:  0.5    10      0.125               0.125   0.000           0.125
##D #  7:  0.6    10      0.125               0.000   0.125           0.000
##D #  8:  0.7    10      0.125               0.000   0.125           0.000
##D #  9:  0.8    10      0.375               0.000   0.375           0.000
##D # 10:  0.9    10      0.500               0.000   0.500           0.000
##D 
## End(Not run)




