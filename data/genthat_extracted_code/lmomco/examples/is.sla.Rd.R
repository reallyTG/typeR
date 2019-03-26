library(lmomco)


### Name: is.sla
### Title: Is a Distribution Parameter Object Typed as Slash
### Aliases: is.sla
### Keywords: utility (distribution, type check) Distribution: Slash

### ** Examples

para <- vec2par(c(12,1.2), type='sla')
if(is.sla(para) == TRUE) {
  Q <- quasla(0.5,para)
}



