library(kutils)


### Name: assignMissing
### Title: Set missing values
### Aliases: assignMissing

### ** Examples

## 1.  Integers.
x <- seq.int(-2L, 22L, by = 2L)
## Exclude scores 8, 10, 18
assignMissing(x, "8;10;18")
## Specify range, 4 to 12 inclusive
missings <- "[4,12]"
assignMissing(x, missings)
## Not inclusive
assignMissing(x,  "(4,12)")
## Set missing for any value smaller that 7
assignMissing(x, "< 7")
assignMissing(x, "<= 8")
assignMissing(x, "> 11")
assignMissing(x, "< -1;2;4;(7, 9);> 20")


## 2. strings
x <- c("low", "low", "med", "high")
missings <- "low;high"
assignMissing(x, missings)
missings <- "med;doesnot exist"
assignMissing(x, missings)
## Test alternate separator
assignMissing(x, "low|med", sep = "|")

## 3. factors (same as strings, really)
x <- factor(c("low", "low", "med", "high"), levels = c("low", "med", "high"))
missings <- "low;high"
assignMissing(x, missings)
## Previous same as
missings <- c("low", "high")
assignMissing(x, missings)

missings <- c("med", "doesnot exist")
assignMissing(x, missings)
## ordered factor:
x <- ordered(c("low", "low", "med", "high"), levels = c("low", "med", "high"))
missings <- c("low", "high")
assignMissing(x, missings)

## 4. Real-valued variable
set.seed(234234)
x <- rnorm(10)
x
missings <- "< 0"
assignMissing(x, missings)
missings <- "> -0.2"
assignMissing(x, missings)
## values above 0.1 and below 0.7 are missing
missings <- "(0.1,0.7)"
assignMissing(x, missings)
## Note that in floating point numbers, it is probably
## futile to specify specific values for missings. Even if we
## type out values to 7 decimals, nothing gets excluded
assignMissing(x, "-0.4879708;0.1435791")
## Can mark a range, however
assignMissing(x, "(-0.487971,-0.487970);(0.14357, 0.14358)")
x



