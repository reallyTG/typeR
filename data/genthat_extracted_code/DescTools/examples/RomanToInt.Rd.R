library(DescTools)


### Name: RomanToInt
### Title: Convert Roman Numerals to Integers
### Aliases: RomanToInt
### Keywords: arith

### ** Examples

RomanToInt( c('I', 'V', 'X', 'C', 'L', 'D', 'M' )  )

# works regardless of case
RomanToInt( 'MMXVI' )
RomanToInt( 'mmxvi' )

# works beyond R's limit of 3899
val.3899 <- 'MMMDCCCXCIX'
val.3900 <- 'MMMCM'
val.4000 <- 'MMMM'
as.numeric(as.roman( val.3899 ))
as.numeric(as.roman( val.3900 ))
as.numeric(as.roman( val.4000 ))

RomanToInt(val.3899)
RomanToInt(val.3900)
RomanToInt(val.4000)




