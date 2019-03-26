library(wicket)


### Name: wkt_correct
### Title: Correct Incorrectly Oriented WKT Objects
### Aliases: wkt_correct

### ** Examples


# A WKT object
wkt <- "POLYGON((30 20, 10 40, 45 40, 30 20), (15 5, 5 10, 10 20, 40 10, 15 5))"

# That's invalid due to a non-default orientation
validate_wkt(wkt)

# And suddenly isn't!
wkt_correct(wkt)



