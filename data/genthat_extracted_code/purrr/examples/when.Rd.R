library(purrr)


### Name: when
### Title: Match/validate a set of conditions for an object and continue
###   with the action associated with the first valid match.
### Aliases: when
### Keywords: internal

### ** Examples

1:10 %>%
  when(
    sum(.) <=  50 ~ sum(.),
    sum(.) <= 100 ~ sum(.)/2,
    ~ 0
  )

1:10 %>%
  when(
    sum(.) <=   x ~ sum(.),
    sum(.) <= 2*x ~ sum(.)/2,
    ~ 0,
    x = 60
  )

iris %>%
  subset(Sepal.Length > 10) %>%
  when(
    nrow(.) > 0 ~ .,
    ~ iris %>% head(10)
  )

iris %>%
  head %>%
  when(nrow(.) < 10 ~ .,
       ~ stop("Expected fewer than 10 rows."))



