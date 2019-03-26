library(textshape)


### Name: flatten
### Title: Flatten a Nested List of Vectors Into a Single Tier List of
###   Vectors
### Aliases: flatten

### ** Examples

x <- list(
    urban = list(
        cars = c('volvo', 'ford'),
        food.dining = list(
            local.business = c('carls'),
            chain.business = c('dennys', 'panera')
        )
    ),
    rural = list(
        land.use = list(
            farming =list(
                dairy = c('cows'),
                vegie.plan = c('carrots')
            )
        ),
        social.rec = list(
            community.center = c('town.square')
        ),
        people.type = c('good', 'bad', 'in.between')
    ),
    other.locales = c('suburban'),
    missing = list(
        unknown = c(),
        known = c()
    ),
    end = c('wow')
)

x

flatten(x)
flatten(x, ' -> ')

## Not run: 
##D ## dictionary from quanteda
##D require(quanteda); library(textreadr); library(dplyr)
##D mydict <- https://provalisresearch.com/Download/LaverGarry.zip" %>%
##D     textreadr::download(") %>%
##D     unzip(exdir = tempdir()) %>%
##D     `[`(1) %>%
##D     quanteda::dictionary(file = .)
##D 
##D mydict
##D flatten(as.list(mydict))
## End(Not run)



