library(rportfolios)


### Name: rgeneral
### Title: Generate random general portfolios
### Aliases: rgeneral
### Keywords: math

### ** Examples

###
### 100 long only portfolios of 30 investments with 30 non-zero positions
###
x.long <- rgeneral( 100, 30, p=1.0 )
###
### 100 long only portfolios of 30 investments with 10 non-zero positions
###
y.long <- rgeneral( 100, 30, 10, p=1.0 )
###
### 100 short only portfolios of 30 investments with 30 non-zero positions
###
x.short <- rgeneral( 100, 30, p=0.0 )
###
### 100 short only portfolios of 30 investments with 10 non-zero positions
###
y.short <- rgeneral( 100, 30, 10, p=0.0 )
###
### 100 long short portfolios of 30 investments with 30 non-zero positions
###
x.long.short <- rgeneral( 100, 30, p=0.5 )
###
### 100 long short portfolios of 30 investments with 10 non-zero positions
###
y.long.short <- rgeneral( 100, 30, 10, p=0.5 )
###
### 100 long bias portfolios of 30 investments with 30 non-zero positions
###
x.long.bias <- rgeneral( 100, 30, p=0.7 )
###
### 100 long bias portfolios of 30 investments with 10 non-zero positions
###
y.long.bias <- rgeneral( 100, 30, 10, p=0.7 )
###
### 100 short bias portfolios of 30 investments with 30 non-zero positions
###
x.short.bias <- rgeneral( 100, 30, p=0.3 )
###
### 100 short bias portfolios of 30 investments with 10 non-zero positions
###
y.short.bias <- rgeneral( 100, 30, 10, p=0.3 )



