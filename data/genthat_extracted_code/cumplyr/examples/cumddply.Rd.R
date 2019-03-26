library(cumplyr)


### Name: cumddply
### Title: Cumulative ddply
### Aliases: cumddply

### ** Examples

library('cumplyr')

data(rt.data)

results <- cumddply(rt.data,
                    c('Subject', 'Block'),
                    c('Trial'),
                    function (df) {with(df, mean(RT))})

print(results)



