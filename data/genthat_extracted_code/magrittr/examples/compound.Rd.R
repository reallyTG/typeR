library(magrittr)


### Name: %<>%
### Title: magrittr compound assignment pipe-operator
### Aliases: %<>%

### ** Examples

iris$Sepal.Length %<>% sqrt

x <- rnorm(100)

x %<>% abs %>% sort

is_weekend <- function(day)
{
   # day could be e.g. character a valid representation
   day %<>% as.Date

   result <- day %>% format("%u") %>% as.numeric %>% is_greater_than(5)

   if (result)
     message(day %>% paste("is a weekend!"))
   else
     message(day %>% paste("is not a weekend!"))

   invisible(result)
}



