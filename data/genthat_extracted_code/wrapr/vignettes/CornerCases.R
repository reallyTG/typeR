## ----exdisj--------------------------------------------------------------
library("wrapr")

X <- 1
Y <- 2

let(
 c(),
  debugPrint = TRUE,
  X + Y
)

let(
 c(),
  debugPrint = TRUE,
  subsMethod = 'langsubs',
  X + Y
)

let(
 c(),
  debugPrint = TRUE,
  subsMethod = 'stringsubs',
  X + Y
)

let(
 c(),
  debugPrint = TRUE,
  subsMethod = 'subsubs',
  X + Y
)

## ----exswap--------------------------------------------------------------
library("wrapr")

X <- 1
Y <- 2

let(
  c(X='Y', Y='X'),
  debugPrint = TRUE,
  X + Y
)

let(
  c(X='Y', Y='X'),
  debugPrint = TRUE,
  subsMethod = 'langsubs',
  X + Y
)

let(
  c(X='Y', Y='X'),
  debugPrint = TRUE,
  subsMethod = 'stringsubs',
  X + Y
)

let(
  c(X='Y', Y='X'),
  debugPrint = TRUE,
  subsMethod = 'subsubs',
  X + Y
)

