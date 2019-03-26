library(Trading)


### Name: HashTable-class
### Title: Hashtable Class
### Aliases: HashTable

### ** Examples


## loading a ratings' mapping matrix from the extdata folder
rating_table = HashTable('RatingsMapping.csv',"character","numeric")
reg_weight =rating_table$FindValue("AAA")




