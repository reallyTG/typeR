library(gtools)


### Name: roman2int
### Title: Convert Roman Numerals to Integers
### Aliases: roman2int
### Keywords: arith

### ** Examples

roman2int( c('I', 'V', 'X', 'C', 'L', 'D', 'M' )  )

# works regardless of case
roman2int( 'MMXVI' )
roman2int( 'mmxvi' )

# works beyond R's limit of 3899
val.3899 <- 'MMMDCCCXCIX'
val.3900 <- 'MMMCM'
val.4000 <- 'MMMM'
as.numeric(as.roman( val.3899 ))
as.numeric(as.roman( val.3900 ))
as.numeric(as.roman( val.4000 ))

roman2int(val.3899)
roman2int(val.3900)
roman2int(val.4000)




