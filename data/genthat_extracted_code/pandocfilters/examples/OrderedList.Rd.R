library(pandocfilters)


### Name: OrderedList
### Title: Ordered List
### Aliases: OrderedList

### ** Examples

ordered_1 <- Plain("A")
ordered_2 <- list(Plain(Str("B")))
ordered_3 <- list(Plain(list(Str("C"))))
OrderedList(ListAttributes(), ordered_1)
OrderedList(ListAttributes(), list(ordered_1, ordered_2, ordered_3))



