library(sjlabelled)


### Name: copy_labels
### Title: Copy value and variable labels to (subsetted) data frames
### Aliases: copy_labels

### ** Examples

library(dplyr)
data(efc)

# create subset - drops label attributes
efc.sub <- subset(efc, subset = e16sex == 1, select = c(4:8))
str(efc.sub)

# copy back attributes from original dataframe
efc.sub <- copy_labels(efc.sub, efc)
str(efc.sub)

# remove all labels
efc.sub <- copy_labels(efc.sub)
str(efc.sub)

# create subset - drops label attributes
efc.sub <- subset(efc, subset = e16sex == 1, select = c(4:8))
# create subset with dplyr's select - attributes are preserved
efc.sub2 <- select(efc, c160age, e42dep, neg_c_7, c82cop1, c84cop3)

# copy labels from those columns that are available
copy_labels(efc.sub, efc.sub2) %>% str()




