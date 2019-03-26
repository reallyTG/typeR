library(FatTailsR)


### Name: checkquantiles
### Title: Check Quantiles and Probabilities
### Aliases: checkquantiles

### ** Examples

    

lst <- list(
  0.8,
  c(0.1, 0.5, 0.8),
  c(0.1, 0.5, 0.8, 0.2),
  c(2, 3, 1),
  c(2, 3),
  -0.01,
  NA,
  c(NA, NA),
  c(0.1, NA),
  c(0.1, NA, 0.5, 0.8),
  c(0.1, NA, 0.8, NA, 0.5),
  c(12, NA)
)

## Evaluate
for (i in seq_along(lst)) { 
  cat(i, lst[[i]], " : ",
      checkquantiles(lst[[i]], proba = FALSE, STOP = FALSE), 
      checkquantiles(lst[[i]], proba = TRUE, STOP = FALSE), 
      checkquantiles(lst[[i]], proba = FALSE, acceptNA = TRUE, STOP = FALSE), 
      checkquantiles(lst[[i]], proba = TRUE,  acceptNA = TRUE, STOP = FALSE), 
	     "\n") 
}

sapply(lst, checkquantiles, proba = TRUE, acceptNA = TRUE, STOP = FALSE)

## Not run: 
checkquantiles(matrix((1:12)/16, ncol=3), proba = TRUE, STOP = FALSE)
## End(Not run)




