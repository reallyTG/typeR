library(taxize)


### Name: names_list
### Title: Get a random vector of species names.
### Aliases: names_list

### ** Examples

names_list()
names_list('species')
names_list('genus')
names_list('family')
names_list('order')
names_list('order', '2')
names_list('order', '15')

# You can get a lot of genus or species names if you want
nrow(theplantlist)
names_list('genus', 500)



