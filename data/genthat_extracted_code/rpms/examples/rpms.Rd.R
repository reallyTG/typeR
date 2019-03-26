library(rpms)


### Name: rpms
### Title: rpms
### Aliases: rpms

### ** Examples

{
# model mean of retirement account value for households with reported 
# retirment account values > 0 using a binary tree while accounting for 
# clusterd data and sample weights.

s1<- which(CE$IRAX > 0)
rpms(IRAX~EDUCA+AGE+BLS_URBN, data=CE[s1,], weights=~FINLWT21, clusters=~CID)

                 
# model linear fit between retirement account value and amount of income
# conditioning on education and accounting for clusterd data for households 
# with reported retirment account values > 0

rpms(IRAX~EDUCA, e_equ=IRAX~FINCBTAX, data=CE[s1,], weights=~FINLWT21, clusters=~CID)    

}



