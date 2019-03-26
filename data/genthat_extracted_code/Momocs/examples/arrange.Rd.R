library(Momocs)


### Name: arrange
### Title: Arrange rows by variables
### Aliases: arrange

### ** Examples

olea
# we create a new column
olea %>% mutate(id=1:length(.)) %$% fac$id
# same but now, shapes are arranged in a desc order, based on id
olea %>% mutate(id=1:length(.)) %>% arrange(desc(id)) %$% fac$id



