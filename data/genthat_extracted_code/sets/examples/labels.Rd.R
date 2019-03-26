library(sets)


### Name: labels
### Title: Labels from objects
### Aliases: LABELS LABEL LABEL.character
### Keywords: math

### ** Examples

LABELS(list(1, "test", X = "1", 1:5))
LABELS(set(X = as.tuple(1:20), "test", list(list(list(1,2)))))
LABELS(set(pair(1,2), set("a", 2), as.tuple(1:10)))
LABELS(set(pair(1,2), set("a", 2), as.tuple(1:10)), limit = 11)



