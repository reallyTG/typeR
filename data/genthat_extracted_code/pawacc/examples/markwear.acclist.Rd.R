library(pawacc)


### Name: markwear.acclist
### Title: Classify wear and non-wear time
### Aliases: markwear markwear.accfile markwear.acclist
### Keywords: wear time Actigraph GT1M Actigraph GT3X

### ** Examples


## Not run: 
##D 
##D data(gt1m_sample)
##D 
##D # 20-minute threshold
##D wear <- markwear(gt1m_sample, value = 20)
##D > table(wear)
##D  wear
##D  Non-wear     Wear 
##D     27572    17338 
## End(Not run)

## Not run: 
##D 
##D # lower threshold
##D wear <- markwear(gt1m_sample, value = 5)
##D > table(wear)
##D  wear
##D  Non-wear     Wear 
##D     30188    14722 
## End(Not run)

## Not run: 
##D 
##D # allow for some non-zero values within a 20-minute window
##D wear <- markwear.accfile(gt1m_sample, value = 20, nz = 2)
##D > table(wear)
##D  wear
##D  Non-wear     Wear 
##D    28198    16712 
## End(Not run)




