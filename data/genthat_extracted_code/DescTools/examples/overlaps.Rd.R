library(DescTools)


### Name: %overlaps%
### Title: Determines If And How Extensively Two Date Ranges Overlap
### Aliases: %overlaps% Interval Overlap
### Keywords: manip

### ** Examples

as.Date(c("2012-01-03", "2012-02-03")) %overlaps%
  as.Date(c("2012-03-01", "2012-03-03"))
as.Date(c("2012-01-03", "2012-02-03")) %overlaps%
  as.Date(c("2012-01-15", "2012-01-21"))

Interval(as.Date(c("2012-01-03", "2012-02-03")), as.Date(c("2012-03-01", "2012-03-03")))


# both ranges are recyled if necessary
as.Date("2012-01-03") %overlaps% as.Date(c("2012-03-01", "2012-03-03"))

# works with numerics as well
c(1, 18) %overlaps% c(10, 45)



