library(rportfolios)


### Name: rgeneral.test
### Title: Generate random general portfolios
### Aliases: rgeneral.test
### Keywords: math

### ** Examples

###
### 100 long only portfolios of 30 investments
###
x.long <- rgeneral.test( 100, 30, p=1.0 )
y.long <- rgeneral.test( 100, 30, 10, p=1.0 )
###
### 100 short only portfolios of 30 investments
###
x.short <- rgeneral.test( 100, 30, p=0.0 )
y.short <- rgeneral.test( 100, 30, 10, p=0.0 )
###
### 100 long short portfolios of 30 investments
###
x.long.short <- rgeneral.test( 100, 30, p=0.5 )
y.long.short <- rgeneral.test( 100, 30, 10, p=0.5 )
###
### 100 long bias portfolios of 30 investments
###
x.long.bias <- rgeneral.test( 100, 30, p=0.7 )
y.long.bias <- rgeneral.test( 100, 30, 10, p=0.7 )
###
### 100 short bias portfolios of 30 investments
###
x.short.bias <- rgeneral.test( 100, 30, p=0.3 )
y.short.bias <- rgeneral.test( 100, 30, 10, p=0.3 )



