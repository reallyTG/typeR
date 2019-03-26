library(jmvcore)


### Name: format
### Title: Format a string with arguments
### Aliases: format

### ** Examples


jmvcore::format('the {} was delish', 'fish')

# 'the fish was delish'

jmvcore::format('the {} was more delish than the {}', 'fish', 'cow')

# 'the fish was more delish than the cow'

jmvcore::format('the {1} was more delish than the {0}', 'fish', 'cow')

# 'the cow was more delish than the fish'

jmvcore::format('the {what} and the {which}', which='fish', what='cow')

# 'the cow and the fish'

jmvcore::format('that is simply not {}', TRUE)

# 'that is simply not true'

jmvcore::format('that is simply not {}', TRUE, context='R')

# 'that is simply not TRUE'




