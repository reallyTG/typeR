library(ggpolypath)


### Name: dathome
### Title: Simple polygon data
### Aliases: dathome maphome

### ** Examples

ggplot(maphome) + aes(x = x_, y = y_, group = branch_, fill = object_) +
geom_polypath() + facet_wrap(~object_, nrow = nrow(dathome))





