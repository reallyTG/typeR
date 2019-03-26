library(soc.ca)


### Name: map.select
### Title: Map select modalities and individuals
### Aliases: map.select

### ** Examples

example(soc.ca)
map.select(result, map.title = "Map of the first ten modalities", list.mod = 1:10)
select   <- active[, 3]
select   <- select == levels(select)[2]
map.select(result, map.title = "Map of all individuals sharing a particular value",
 list.ind = select, point.size = 3)
map.select(result, map.title = "Map of both select individuals and modalities",
 list.ind = select, list.mod = 1:10)



