library(pairwise)


### Name: iff
### Title: Item information function
### Aliases: iff

### ** Examples

########
data(sim200x3)
result <- pair(sim200x3)
# IFF plot for Item No. 2 
iff(pair_obj = result, itemnumber = 2 ) 
# IFF plot for Categories of Item No. 2
iff(pair_obj = result, itemnumber = 2 ,cat=TRUE)
# IFF at theta=0 for Item No. 2 
iff(pair_obj = result, itemnumber = 2 ,x=0) 
# IFF at theta=0 for Categories of Item No. 2
iff(pair_obj = result, itemnumber = 2 ,x=0,cat=TRUE)
# IFF of Item No. 2 for a given range of thetas 
iff(pair_obj = result, itemnumber = 2 ,x=seq(0,4,.1)) 
# ... etc.
iff(pair_obj = result, itemnumber = 2 ,x=seq(0,4,.1),cat=TRUE) 
##### examples with other data ...
data(bfiN)
result <- pair(bfiN)
iff(pair_obj = result, itemnumber = 3 )
iff(pair_obj = result, itemnumber = 3 ,cat=TRUE)



