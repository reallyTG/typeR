library(lmomco)


### Name: is.wak
### Title: Is a Distribution Parameter Object Typed as Wakeby
### Aliases: is.wak
### Keywords: utility (distribution, type check) Distribution: Wakeby

### ** Examples

para <- parwak(lmoms(c(123,34,4,654,37,78)))
if(is.wak(para) == TRUE) {
  Q <- quawak(0.5,para)
}



