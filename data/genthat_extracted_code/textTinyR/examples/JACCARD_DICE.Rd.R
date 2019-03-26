library(textTinyR)


### Name: JACCARD_DICE
### Title: Jaccard or Dice similarity for text documents
### Aliases: JACCARD_DICE

### ** Examples


library(textTinyR)

lst1 = list(c('use', 'this', 'function', 'to'), c('either', 'compute', 'the', 'jaccard'))

lst2 = list(c('or', 'the', 'dice', 'distance'), c('for', 'two', 'same', 'sized', 'lists'))

out = JACCARD_DICE(token_list1 = lst1, token_list2 = lst2, method = 'jaccard', threads = 1)



