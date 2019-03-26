library(icesAdvice)


### Name: icesRound
### Title: ICES Rounding Method
### Aliases: icesRound

### ** Examples

icesRound(0.123456)
icesRound(0.2468)

## Formatted string or numeric
icesRound(1.0)
as.numeric(icesRound(1.0))

## Percent, sign, NA
icesRound(33.33, percent = TRUE)
icesRound(33.33, sign = TRUE)
icesRound(c(1, NA, 3))
icesRound(c(1, NA, 3), na = NA)

## Example from the ICES Technical Guidelines
Actual <- c(0.35776, 0.34665, 0.202, 0.12665, 0.001567, 0.002567, 0.013415,
            0.02315, 1.168, 2.15678)
Rounded <- icesRound(Actual)
print(data.frame(Actual = as.character(Actual), Rounded), row.names = FALSE)

## Continued example from Guidelines, now rounding percentages
Actual <- c(9.546, 10.546, 23.445, -1.482, -9.09, 0.51, 130.11, 584)
Rounded <- icesRound(Actual, percent = TRUE)
print(data.frame(Actual = as.character(Actual), Rounded), row.names = FALSE)




