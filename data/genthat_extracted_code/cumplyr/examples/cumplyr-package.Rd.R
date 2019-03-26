library(cumplyr)


### Name: cumplyr-package
### Title: Extends ddply to allow calculation of cumulative quantities.
### Aliases: cumplyr-package cumplyr
### Keywords: package

### ** Examples

library('cumplyr')

data(rt.data)

results <- cumddply(rt.data,
                    c('Subject', 'Block'),
                    c('Trial'),
                    function (df) {with(df, mean(RT))})

print(results)



