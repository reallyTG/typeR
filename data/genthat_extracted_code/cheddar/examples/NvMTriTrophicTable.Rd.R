library(cheddar)


### Name: NvMTriTrophicTable
### Title: N-versus-M tri-trophic statistics
### Aliases: NvMTriTrophicTable
### Keywords: utilities

### ** Examples

data(TL84, TL86, YthanEstuary)
collection <- CommunityCollection(list(TL84, TL86, YthanEstuary))
table <- NvMTriTrophicTable(collection)
print(round(table, 2))



