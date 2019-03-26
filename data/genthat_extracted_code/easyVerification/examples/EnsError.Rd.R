library(easyVerification)


### Name: EnsError
### Title: Ensemble Mean Error
### Aliases: EnsError EnsMe EnsMae EnsMse EnsRmse

### ** Examples

#forecast and observations
tm <- toymodel()

# compute the mean bias
EnsError(tm$fcst, tm$obs, type='me')
# equivalently
EnsMe(tm$fcst, tm$obs)




