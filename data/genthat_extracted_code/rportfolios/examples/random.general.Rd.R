library(rportfolios)


### Name: random.general
### Title: Random general portfolio
### Aliases: random.general
### Keywords: math

### ** Examples

###
### long only portfolio of 30 investments with 30 non zero positions
###
x.long <- random.general( 30, p=1.0 )
###
### long only portfolio of 30 investments with 10 non zero positions
###
y.long <- random.general( 30, 10, p=1.0 )
###
### short only portfolio of 30 investments with 30 non zero positions
###
x.short <- random.general( 30, p=0.0 )
###
### short only portfolio of 30 investments with 10 non zero positions
###
y.short <- random.general( 30, 10, p=1.0 )
###
### long short portfolio of 30 investments with 30 non zero positions
###
x.long.short <- random.general( 30, p=0.5 )
###
### long short portfolio of 30 investments with 10 non zero positions
###
y.long.short <- random.general( 30, 10, p=0.5 )
###
### long bias portfolio of 30 investments with 30 non zero positions
###
x.long.bias <- random.general( 30, p=0.7 )
###
### long bias portfolio of 30 investments with 10 non zero positions
###
y.long.bias <- random.general( 30, 10, p=0.7 )
###
### short bias portfolio of 30 investments with 30 non zero positions
###
x.short.bias <- random.general( 30, p=0.3 )
###
### short bias portfolio of 30 investments with 10 non zero positions
###
y.short.bias <- random.general( 30, 10, p=0.3 )



