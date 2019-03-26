library(circlize)


### Name: adjacencyList2Matrix
### Title: Convert adjacency list to adjacency matrix
### Aliases: adjacencyList2Matrix

### ** Examples

lt = data.frame(letters[1:5], letters[6:10])
adjacencyList2Matrix(lt)

lt = data.frame(letters[1:5], letters[6:10], 1:5)
adjacencyList2Matrix(lt)

set.seed(123)
lt = data.frame(sample(letters, 4), sample(letters, 4), 1:4)
adjacencyList2Matrix(lt)
adjacencyList2Matrix(lt, square = TRUE)




