library(GA)


### Name: binary2decimal
### Title: Binary encoding of decimal numbers and viceversa.
### Aliases: binary2decimal decimal2binary

### ** Examples

# for integer values
dval <- 12
(bval <- decimal2binary(dval))
binary2decimal(bval)

# for real values
dval <- 12.456
# use
(bval <- decimal2binary(dval*1000))
binary2decimal(bval)/1000



