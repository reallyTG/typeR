library(psd)


### Name: modulo_floor
### Title: Nearest value below
### Aliases: modulo_floor

### ** Examples

n <- 11
nextn(n) # 12
modulo_floor(n) # 10

# works on vectors too:
# defaults to m=2
modulo_floor(seq_len(n))
#[1]  0  2  2  4  4  6  6  8  8 10 10

# change the floor factor
modulo_floor(seq_len(n), 3)
#[1] 0 0 3 3 3 6 6 6 9 9 9

# zeros are not allowed for m
try(modulo_floor(n, 0))



