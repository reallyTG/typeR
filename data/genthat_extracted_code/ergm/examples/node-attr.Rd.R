library(ergm)


### Name: node-attr
### Title: Specifying nodal attributes and their levels
### Aliases: node-attr attrname on by attrs

### ** Examples


data(faux.mesa.high)
# Mixing between lower and upper grades:
summary(faux.mesa.high~mm(~Grade>=10))
# Mixing between grades 7 and 8 only:
summary(faux.mesa.high~mm("Grade", levels=I(c(7,8))))
# or
summary(faux.mesa.high~mm("Grade", levels=1:2))
# or using levels2 (see ? mm) to filter the combinations of levels,
summary(faux.mesa.high~mm("Grade",
        levels2=~sapply(.levels,
                        function(l)
                          l[[1]]%in%c(7,8) && l[[2]]%in%c(7,8))))



