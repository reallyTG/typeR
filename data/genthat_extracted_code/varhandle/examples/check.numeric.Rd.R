library(varhandle)


### Name: check.numeric
### Title: Check the vector's possiblity to convert to numeric
### Aliases: check.numeric
### Keywords: check numeric

### ** Examples

    # Create a vector with NA
    a <- as.character(c(1:5, NA, seq(from=6, to=7, by=0.2)))
    # see what we created
    print(a)
    # check if the vector is all numbers (not ignoring NAs)
    check.numeric(a)
    # check if the vector is all numbers (ignoring NAs)
    check.numeric(a, na.rm=TRUE)
    # if all the items in vector a are safe for numeric conversion
    if(all(check.numeric(a))){
        # convert the vector to numeric
        a <- as.numeric(a)
    }

    # create a complicated vector
    b <- c("1", "2.2", "3.", ".4", ".5.", "..6", "seven", "00008",
           "90000", "-10", "+11", "12-", "--13", "++14", NA, "",
           " 7 ", "   ")
    # show in propper format
    print(data.frame(value=b, check.numeric=check.numeric(b)))
    #      value check.numeric
    # 1        1          TRUE
    # 2      2.2          TRUE
    # 3       3.          TRUE
    # 4       .4          TRUE
    # 5      .5.         FALSE
    # 6      ..6         FALSE
    # 7    seven         FALSE
    # 8    00008          TRUE
    # 9    90000          TRUE
    # 10     -10          TRUE
    # 11     +11          TRUE
    # 12     12-         FALSE
    # 13    --13         FALSE
    # 14    ++14         FALSE
    # 15    <NA>          TRUE
    # 16                  TRUE
    # 17      7           TRUE
    # 18                  TRUE



