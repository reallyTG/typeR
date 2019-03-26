library(jsonify)


### Name: to_json
### Title: To JSON
### Aliases: to_json

### ** Examples


to_json(1:3)
to_json(letters[1:3])
to_json(data.frame(x = 1:3, y = letters[1:3]))
to_json(list(x = 1:3, y = list(z = letters[1:3])))
to_json(seq(as.Date("2018-01-01"), as.Date("2018-01-05"), length.out = 5))
to_json(seq(as.Date("2018-01-01"), as.Date("2018-01-05"), length.out = 5), numeric_dates = FALSE)

psx <- seq(
  as.POSIXct("2018-01-01", tz = "Australia/Melbourne"), 
  as.POSIXct("2018-02-01", tz = "Australia/Melbourne"), 
  length.out = 5
  )
to_json(psx)
to_json(psx, numeric_dates = FALSE)

## unbox single-value arrays
to_json(list(x = 1), unbox = TRUE)
to_json(list(x = 1, y = c("a"), z = list(x = 2, y = c("b"))), unbox = TRUE)

## rounding numbers using the digits argument
to_json(1.23456789, digits = 2)
df <- data.frame(x = 1L:3L, y = rnorm(3), z = letters[1:3])
to_json(df, digits = 0 )

## keeping factors
to_json(df, digits = 2, factors_as_string = FALSE )





