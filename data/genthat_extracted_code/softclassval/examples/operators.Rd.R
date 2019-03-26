library(softclassval)


### Name: strong
### Title: And (conjunction) operators
### Aliases: and gdl luk prd strong wMAE wMSE wRMAE wRMSE weak

### ** Examples

ops <- c ("luk", "gdl", "prd", "and", "wMAE", "wRMAE", "wMSE", "wRMSE")

## make a nice table


lastline <- function (f){
  body <- body (get (f))    ## function body
  body <- deparse (body)
  body [length (body) - 1]  ## last line is closing brace
}

data.frame (source = sapply (ops, lastline),
            dev = sapply (ops, function (f) dev (get (f))),
            hard = sapply (ops, function (f) hard (get (f))),
            postproc = I (lapply (ops, function (f) postproc (get (f))))
            )

x <- softclassval:::v
x

luk (0.7, 0.8)

## The behaviour of the operators
## op (x, 1)
cbind (x, sapply (c ("luk", "gdl", "prd", "wMAE", "wRMAE", "wMSE", "wRMSE"),
                  function (op, x) get (op) (x, 1), x))

## op (x, 0)
cbind (x, sapply (c ("luk", "gdl", "prd", "wMAE", "wRMAE", "wMSE", "wRMSE"),
                  function (op, x) get (op) (x, 0), x))

## op (x, x)
cbind (x, sapply (c ("luk", "gdl", "prd", "wMAE", "wRMAE", "wMSE", "wRMSE"),
                  function (op, x) get (op) (x, x), x))


## Note that the deviation operators are not commutative
## (due to the weighting by reference)
zapsmall (
cbind (sapply (c ("luk", "gdl", "prd", "wMAE", "wRMAE", "wMSE", "wRMSE"),
                  function (op, x) get (op) (1, x), x)) -
cbind (sapply (c ("luk", "gdl", "prd", "wMAE", "wRMAE", "wMSE", "wRMSE"),
                  function (op, x) get (op) (x, 1), x))
)





