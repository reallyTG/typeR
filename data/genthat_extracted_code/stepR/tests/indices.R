###
# compare indices, has to be implemented for all interval systems
# indices <- function(...)
# return list(li = ..., ri = ...)
###

# all intervals, all lengths
indicesAll <- function(n, ...) {
  li <- integer(n * (n + 1) / 2)
  ri <- integer(n * (n + 1) / 2)
  
  index <- 0
  for (j in 1:n) {
    for (i in j:1) {
      index <- index + 1
      li[index] <- i
      ri[index] <- j
    }
  }
  
  list(li = li, ri = ri)  
}

# all intervals, given lengths
indicesAllLengths <- function(n, lengths, ...) {
  li <- integer(n * (n + 1) / 2)
  ri <- integer(n * (n + 1) / 2)
  
  index <- 0
  for (j in 1:n) {
    for (i in j:1) {
      if ((j - i + 1) %in% lengths) {
        index <- index + 1
        li[index] <- i
        ri[index] <- j
      }
    }
  }
  
  list(li = li[li > 0], ri = ri[ri > 0])  
}

# dyaLen
indicesDyaLen <- function(n, ...) {
  li <- integer(floor(log2(n)) * n)
  ri <- integer(floor(log2(n)) * n)
  
  index <- 0
  for (logLen in 0:floor(log2(n))) {
    for (i in 1:(n - 2^logLen + 1)) {
      index <- index + 1
      li[index] <- as.integer(i)
      ri[index] <- as.integer(i + 2^logLen - 1L)
    }
  }  
  
  list(li = li[li > 0], ri = ri[ri > 0])  
}

# dyaLen given lengths
indicesDyaLenLengths <- function(n, lengths, ...) {
  li <- integer(floor(log2(n)) * n)
  ri <- integer(floor(log2(n)) * n)
  
  
  index <- 0
  for (logLen in 0:floor(log2(n))) {
    if (2^logLen %in% lengths) {
      for (i in 1:(n - 2^logLen + 1)) {
        index <- index + 1
        li[index] <- as.integer(i)
        ri[index] <- as.integer(i + 2^logLen - 1L)
      }
    }
  }  
  
  list(li = li[li > 0], ri = ri[ri > 0])  
}

# dyaPar
indicesDyaPar <- function(n, ...) {
  li <- integer(2 * n)
  ri <- integer(2 * n)
  
  index <- 0
  for (logLen in 0:floor(log2(n))) {
    for (i in 1:floor(n / 2^logLen)) {
      index <- index + 1
      li[index] <- as.integer((i - 1L) * 2^logLen + 1L)
      ri[index] <- as.integer(i * 2^logLen)
    }
  }  
  
  list(li = li[li > 0], ri = ri[ri > 0])  
}

# dyaPar given lengths
indicesDyaParLengths <- function(n, lengths, ...) {
  li <- integer(2 * n)
  ri <- integer(2 * n)
  
  
  index <- 0
  for (logLen in 0:floor(log2(n))) {
    if (2^logLen %in% lengths) {
      for (i in 1:floor(n / 2^logLen)) {
        index <- index + 1
        li[index] <- as.integer((i - 1L) * 2^logLen + 1L)
        ri[index] <- as.integer(i * 2^logLen)
      }
    }
  }  
  
  list(li = li[li > 0], ri = ri[ri > 0])  
}
