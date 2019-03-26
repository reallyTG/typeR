library(nat)


### Name: neuronlist-dataframe-methods
### Title: Methods for working with the dataframe attached to a neuronlist
### Aliases: neuronlist-dataframe-methods [.neuronlist [<-.neuronlist
###   neuronlist-dataframe-methods droplevels.neuronlist droplevels
###   with.neuronlist with head.neuronlist head tail.neuronlist tail

### ** Examples

## treat kcs20 as data.frame
kcs20[1, ]
kcs20[1:3, ]
kcs20[, 1:4]
kcs20[, 'soma_side']
# alternative to as.data.frame(kcs20)
kcs20[, ]

## can also set columns
kcs13=kcs20[1:3]
kcs13[,'side']=as.character(kcs13[,'soma_side'])
head(kcs13)
# or parts of columns
kcs13[1,'soma_side']='R'
kcs13['FruMARCM-M001205_seg002','soma_side']='L'
# remove a column
kcs13[,'side']=NULL
all.equal(kcs13, kcs20[1:3])

# can even replace the whole data.frame like this
kcs13[,]=kcs13[,]
all.equal(kcs13, kcs20[1:3])

## get row/column names of attached data.frame 
# (unfortunately implementing ncol/nrow is challenging)
rownames(kcs20)
colnames(kcs20)



