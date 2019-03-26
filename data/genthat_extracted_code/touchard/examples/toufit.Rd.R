library(touchard)


### Name: toufit
### Title: Touchard Estimation
### Aliases: toufit

### ** Examples

data(Epilepsy)
# 'seizures' is vector of raw data (351 counts) 
toufit( x = seizures, method = 'ml' )
toufit( x = seizures, method = 'mm' )
toufit( x = seizures, method = 'gmm' )

# suppose data were recorded as table object
TAB <- table(seizures)
TAB
toufit(TAB)  # same as above (method = 'ml') 

# suppose data were recorded as data.frame 
DF <- data.frame( y = as.numeric(names(TAB)), fr = as.numeric(TAB) )
DF
toufit(x = DF$y, freq = DF$fr) # same as above (method = 'ml') 



