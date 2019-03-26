library(IBDsim)


### Name: IBDsim
### Title: IBD simulation
### Aliases: IBDsim
### Keywords: math

### ** Examples

# In all examples below, the 'sims' parameter is set to 1 to 
# decrease runtime. For realistic results increase to e.g. 1000.

#### An example with a recessive disease in a consanguineous pedigree:

x = linkdat(twoloops)
plot(x)

# If individuals 15, 16 and 17 are available for sequencing, we can 
# predict the number and size of disease-compatible IBD segments as 
# follows:

sap1 = list('2'=15:16, 'atmost1'=17)
IBDsim(x, sims=1, condition=sap1, query=sap1)

# If 16 is unavailable, his parents and healthy sibling are still 
# informative. The regions we are looking for now are those with 
# an allele present in 2 copies in 15, 1 copy in 12 and 14, and 
# at most one in 17. Note that the condition SAP remains as above.

IBDsim(x, sims=1, condition=sap1, 
       query=list('2'=15, '1'=c(12,14), 'atmost1'=17))

	   
#### Example with an autosomal dominant disorder:
y = linkdat(dominant1) # lazy load data
plot(y)

# Suppose a 20 Mb linkage peak is found. 
# How often would this occur by chance?

aff = which(dominant1[,'AFF']==2)   # the affected
nonaff = which(dominant1[,'AFF']==1)   # the non-affected
dom_pattern = list('1'=aff, '0'=nonaff)
res = IBDsim(y, sims=1, query=dom_pattern) 
mean(res$stats['longest.all',] > 20)   # the estimated p-value


#### Another example: Unconditional simulation of regions shared 
# IBD by third cousins. The "zeroprob" entry in the output shows 
# the percentage of simulations having no IBD-sharing among the 
# two cousins. (Again: Increase 'sims' for more accurate results.)

x_male = cousinPed(3)
plot(x_male)
IBDsim(x_male, sims=1, query=list('1'=15:16))

# Changing the genders of the individuals connecting the cousins 
# can have a big impact on the distribution of IBD segments:

x_female = swapSex(x_male, c(3,4,7,8,11,12))
plot(x_female)
IBDsim(x_female, sims=1, query=list('1'=15:16))

## Given that the two third cousins have at least one segment in 
# common, what is the expected length of this segment? We simulate 
# conditional on one allele in common between the cousins. The 
# "length.dis" entry of the summary shows the average length of 
# the disease region (which should be quite a lot larger than 
# an average random segment).

sap = list('1'=15:16)
IBDsim(x_male, sims=1, condition=sap, query=sap)


#### Let us look at a different relationship: Half first cousins. 
# Two such cousins will on average share 1/8 = 12.5% of the autosome.  

z = halfCousinPed(1)
plot(z)
res = IBDsim(z, sims=1, query=list('1'=8:9)) 
res$stats

# visualizing the spread in total IBD sharing and the number of segments:

IBD_percent = res$stats['fraction.all', ]
IBD_count = res$stats['count.all', ]
hist(IBD_percent) 
hist(IBD_count)



