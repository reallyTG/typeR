library(multicon)


### Name: item.ICC
### Title: Item Intra-class Correlations
### Aliases: item.ICC
### Keywords: Intraclass correlation Agreement

### ** Examples

data(acq1)
data(acq2)
   #lets look at the item ICC between two aquaintance ratings of subjects' personality
   #on 100 personality traits. Notice the columns of each data.frame are corresponding.
names(acq1) 
names(acq2)
item.ICC(acq1, acq2)
   # We can get the descriptives for these using describe() from the 'psych' package   
describe(item.ICC(acq1, acq2))



