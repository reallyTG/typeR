requireR(function() {
  x <- list(1, 2, 3, 5, 8)
  list(
    setStart = function(y) {
      x[[1]] <<- y
    },
    setEnd = function(y) {
      x[[length(x)]] <<- y
    },
    get = function() {
      x
    }
  )
})
