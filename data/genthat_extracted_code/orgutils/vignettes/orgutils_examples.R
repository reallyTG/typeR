### R code from vignette source 'orgutils_examples.Rnw'

###################################################
### code chunk number 1: orgutils_examples.Rnw:25-26
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: orgutils_examples.Rnw:44-46
###################################################
df <- data.frame(numbers = 1:5, row.names = LETTERS[1:5])
df


###################################################
### code chunk number 3: orgutils_examples.Rnw:50-52
###################################################
require("orgutils")
toOrg(df)


###################################################
### code chunk number 4: orgutils_examples.Rnw:60-63
###################################################
toOrg(Sys.Date())
toOrg(Sys.time())
toOrg(Sys.time(), inactive = TRUE)


###################################################
### code chunk number 5: orgutils_examples.Rnw:104-137
###################################################
file <- 
"
#+TITLE: My table file

There is text.

#+name: table1
| A | B | C |
|---+---+---|
| 1 | 2 | 3 |
| 4 | 5 | 6 |

And more text.

#+name: table2
| D | E | F |
|---+---+---|
| 1 | 2 | 3 |
| 4 | 5 | X |

And more text.

#+name: table3
| G | H | I |
|---+---+---|
| 5 | 7 | 9 |
| 6 | 8 | 0 |

And more text.

"

writeLines(file, filename <- tempfile())


###################################################
### code chunk number 6: orgutils_examples.Rnw:142-143
###################################################
readOrg(filename, table.name = "table2")


###################################################
### code chunk number 7: orgutils_examples.Rnw:146-147
###################################################
toLatex(sessionInfo())


