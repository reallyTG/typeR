## ---- results='hide', echo=FALSE, message=FALSE--------------------------
library(crunch)

## ------------------------------------------------------------------------
income <- AbstractCategories(AbstractCategory(name = "<$25,000"),
                             AbstractCategory(name = "$25,000-$49,999"),
                             AbstractCategory(name = "$50,000-$99,999"),
                             AbstractCategory(name = "$100,000-$199,999"),
                             AbstractCategory(name = ">$200,000"))

## ------------------------------------------------------------------------
income <- AbstractCategories(list(name = "<$25,000"),
                             list(name = "$25,000-$49,999"),
                             list(name = "$50,000-$99,999"),
                             list(name = "$100,000-$199,999"),
                             list(name = ">$200,000"))

## ------------------------------------------------------------------------
income_list <- list(list(name = "<$25,000"),
                    list(name = "$25,000-$49,999"),
                    list(name = "$50,000-$99,999"),
                    list(name = "$100,000-$199,999"),
                    list(name = ">$200,000"))
income <- AbstractCategories(data=income_list)

## ------------------------------------------------------------------------
feeling_cats <- Categories(
    list(name = "Very Happy", id = 1),
    list(name = "Somewhat Happy", id = 2),
    list(name = "Neither Happy nor Unhappy", id = 3),
    list(name = "Somewhat Unhappy", id = 4),
    list(name = "Very Unhappy", id = 5)
)
feeling_cats

## ------------------------------------------------------------------------
feeling_subtotals <- Insertions(
    Heading(name = "How I feel about cheese", position = "top"),
    Subtotal(name = "Generally Happy", after = "Somewhat Happy", 
        categories = c("Very Happy", "Somewhat Happy")),
    Subtotal(name = "Generally Unhappy", after = 5, 
        categories = c(4, 5))
)

## ------------------------------------------------------------------------
feeling_subtotals[[2]]$after
feeling_subtotals[[2]]$categories

## ------------------------------------------------------------------------
feeling_subtotals[[3]]$after
feeling_subtotals[[3]]$categories

## ------------------------------------------------------------------------
feeling_insertions <- Insertions(data = lapply(feeling_subtotals, makeInsertion, var_categories = feeling_cats))

## ------------------------------------------------------------------------
sapply(feeling_insertions, class)

## ------------------------------------------------------------------------
feeling_insertions[[3]]$anchor
feeling_insertions[[3]]$`function`
feeling_insertions[[3]]$args

## ------------------------------------------------------------------------
feeling_insertions[[2]]$anchor
feeling_insertions[[2]]$args

## ------------------------------------------------------------------------
feeling_subtotals_again <- subtypeInsertions(feeling_insertions)
sapply(feeling_subtotals_again, class)

