library(lordif)


### Name: collapse
### Title: collapses response categories
### Aliases: collapse

### ** Examples

  r1 <- c(1,1,2,1,1,2,2,1,2,2,1,2,2,1,1,2,1,2,2,3,3,1,2,3)
  gr <- c(0,0,0,1,1,0,1,1,0,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1) 
  collapse(r1,gr,2) #minCell=2
  ## returns  c(1,1,2,1,1,2,2,1,2,2,1,2,2,1,1,2,1,2,2,2,2,1,2,2)
  ## response categories 2 and 3 are collapsed



