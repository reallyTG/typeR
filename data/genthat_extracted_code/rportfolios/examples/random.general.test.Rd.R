library(rportfolios)


### Name: random.general.test
### Title: Random general portfolio
### Aliases: random.general.test
### Keywords: math

### ** Examples

###
### long only portfolio of 30 investments with 30 non-zero positions
###
result.x.long <- random.general.test( 30, p=1.0 )
###
### long only portfolio of 30 investments with 10 non-zero positions
###
result.y.long <- random.general.test( 30, 10, p=1.0 )
###
### short only portfolio of 30 investments with 30 non-zero positions
###
result.x.short <- random.general.test( 30, p=0.0 )
###
### short only portfolio of 30 investments with 10 non-zero positions
###
result.y.short <- random.general.test( 30,10,  p=0.0 )
###
### long short portfolio of 30 investments with 30 non-zero positions
###
result.x.long.short <- random.general.test( 30, p=0.5 )
###
### long short portfolio of 30 investments with 10 non-zero positions
###
result.y.long.short <- random.general.test( 30, 10, p=0.5 )
###
### long bias portfolio of 30 investments with 30 non-zero positions
###
result.x.long.bias <- random.general.test( 30, p=0.7 )
###
### long bias portfolio of 30 investments with 10 non-zero positions
###
result.y.long.bias <- random.general.test( 30, 10, p=0.7 )
###
### short bias portfolio of 30 investments with 30 non-zero positions
###
result.x.short.bias <- random.general.test( 30, p=0.3 )
###
### short bias portfolio of 30 investments with 10 non-zero positions
###
result.y.short.bias <- random.general.test( 30, 10, p=0.3 )



