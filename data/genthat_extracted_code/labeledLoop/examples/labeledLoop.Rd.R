library(labeledLoop)


### Name: %._.%
### Title: Labeled loop and break
### Aliases: ._. %._.% labeledLoop labeledLoop-package package-labeledLoop

### ** Examples

. %._.% for(i in 1:3) {
  foo %._.% for (j in 1:3) {
    orz %._.% for (k in 1:3) {
      print(c(i, j, k))

      if (i == 3 && j == 3 && k == 2) {
        cat("escape from outmost loop\n")
        ._.() # break
      }

      if (i == 2 && j == 2) {
        cat("escape from innermost loop (orz)\n")
        ._.(orz) # break
      }

      if (i == 1 && j == 1 && k == 2) {
        cat("escape from foo\n")
        ._.(foo) # break
      }
    }
  }
}



