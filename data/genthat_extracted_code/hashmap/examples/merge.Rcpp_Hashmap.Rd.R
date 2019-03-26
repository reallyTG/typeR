library(hashmap)


### Name: merge
### Title: Merge two Hashmaps
### Aliases: merge merge.Rcpp_Hashmap

### ** Examples

hx <- hashmap(LETTERS[1:5], 1:5)
hy <- hashmap(LETTERS[4:8], 4:8)

## inner join
merge(hx, hy)

merge(
    hx$data.frame(),
    hy$data.frame(),
    by = "Keys",
    sort = FALSE
)

## left join
merge(hx, hy, "left")

merge(
    hx$data.frame(),
    hy$data.frame(),
    by = "Keys",
    all.x = TRUE,
    sort = FALSE
)

## right join
merge(hx, hy, "right")

merge(
    hx$data.frame(),
    hy$data.frame(),
    by = "Keys",
    all.y = TRUE,
    sort = FALSE
)

## full outer join
merge(hx, hy, "full")

merge(
    hx$data.frame(),
    hy$data.frame(),
    by = "Keys",
    all = TRUE,
    sort = FALSE
)



