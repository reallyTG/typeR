library(validate)


### Name: as.data.frame,confrontation-method
### Title: Coerce a confrontation object to data frame
### Aliases: as.data.frame,confrontation-method

### ** Examples

cf <- check_that(women, height > 0, sd(weight) > 0)
as.data.frame(cf)

# add id-column
women$id <- letters[1:15]
i <- indicator(mw = mean(weight), ratio = weight/height)
as.data.frame(confront(women, i, key="id"))




